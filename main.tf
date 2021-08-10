/**
* Deploys [chartmuseum](https://chartmuseum.com) to AWS EKS.
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
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

module "iam" {
  source                = "./modules/iam"
  cluster_oidc_provider = var.cluster_oidc_provider
  k8s_sa_name           = var.k8s_sa_name
  k8s_namespace         = var.k8s_namespace
  s3_bucket_name        = var.s3_bucket_name
}

module "resources" {
  source                    = "./modules/resources"
  iam_role_arn              = module.iam.role.arn
  s3_bucket_name            = var.s3_bucket_name
  s3_object_key_prefix      = var.s3_object_key_prefix
  k8s_sa_name               = var.k8s_sa_name
  k8s_namespace             = var.k8s_namespace
  chart_version_chartmuseum = var.chart_version_chartmuseum
}
