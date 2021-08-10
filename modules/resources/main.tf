/**
* Helm resources
*/
terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.46.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.3.2"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }

  }
}

data "aws_region" "current" {}

resource "helm_release" "chartmuseum" {

  name       = "chartmuseum"
  namespace  = var.k8s_namespace
  repository = "https://chartmuseum.github.io/charts"
  chart      = "chartmuseum"
  version    = var.chart_version_chartmuseum

  recreate_pods   = true
  atomic          = true
  cleanup_on_fail = true
  wait            = true
  timeout         = 900
  max_history     = 2

  values = [
    templatefile("${path.module}/helm-values/chartmuseum.yml.tpl", {
      aws_region           = data.aws_region.current.name
      s3_bucket_name       = var.s3_bucket_name
      s3_object_key_prefix = var.s3_object_key_prefix
      k8s_sa_name          = var.k8s_sa_name
      iam_role_arn         = var.iam_role_arn
    })
  ]

}

