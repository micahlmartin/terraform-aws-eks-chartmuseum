/**
* Deploys IAM resources for Chartmuseum:
* - Chartmuseum IAM role for the Kubernetes service account
* - managed IAM policies for access to Charmuseum storage
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }
  }
}

data "aws_partition" "current" {}

## policy documents

locals {
  s3_bucket_arn = "arn:${data.aws_partition.current.partition}:s3:::${var.s3_bucket_name}"
}

data "aws_iam_policy_document" "storage_read" {

  statement {
    sid = "AllowRead"
    actions = [
      "s3:List*",
      "s3:Get*"
    ]
    resources = [
      local.s3_bucket_arn,
      "${local.s3_bucket_arn}/*"
    ]
  }

}

data "aws_iam_policy_document" "storage_readwrite" {
  source_json = data.aws_iam_policy_document.storage_read.json
  statement {
    sid = "AllowWrite"
    actions = [
      "s3:DeleteObject",
      "s3:PutObject"
    ]
    resources = ["${local.s3_bucket_arn}/*"]
  }
}

## end policy documents

## policies

resource "aws_iam_policy" "storage_read" {
  count       = var.create_iam_managed_policies ? 1 : 0
  name        = "chartmuseum-readonly"
  policy      = data.aws_iam_policy_document.storage_read.json
  description = "Allows read-only access to Chartmuseum storage bucket"
}


resource "aws_iam_policy" "storage_readwrite" {
  count       = var.create_iam_managed_policies ? 1 : 0
  name        = "chartmuseum-readwrite"
  description = "Allows read and write access to Chartmuseum storage bucket"
  policy      = data.aws_iam_policy_document.storage_readwrite.json
}

## end policies

## role

locals {
  iam_role_name                 = var.iam_role_name == "" ? null : var.iam_role_name
  iam_role_permissions_document = var.iam_role_allow_write ? data.aws_iam_policy_document.storage_readwrite : data.aws_iam_policy_document.storage_read
}

module "assume_role_policy" {
  count                 = var.create_iam_role ? 1 : 0
  source                = "andreswebs/eks-irsa-policy-document/aws"
  k8s_sa_name           = var.k8s_sa_name
  k8s_sa_namespace      = var.k8s_namespace
  cluster_oidc_provider = var.cluster_oidc_provider
}

resource "aws_iam_role" "chartmuseum" {
  count              = var.create_iam_role ? 1 : 0
  name               = local.iam_role_name
  assume_role_policy = module.assume_role_policy[0].json
}

# resource "aws_iam_role_policy_attachment" "storage_read" {
#   count      = var.create_iam_role ? 1 : 0
#   policy_arn = aws_iam_policy.storage_read.arn
#   role       = aws_iam_role.chartmuseum[0].id
# }


resource "aws_iam_role_policy" "chartmuseum_permissions" {
  count  = var.create_iam_role ? 1 : 0
  name   = "chartmuseum-permissions"
  role   = aws_iam_role.chartmuseum[0].id
  policy = local.iam_role_permissions_document.json
}

## end role
