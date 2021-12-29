/**
* Deploys the Chartmuseum Helm chart
*/

data "aws_region" "current" {}

resource "helm_release" "this" {

  name       = var.helm_release_name
  namespace  = var.k8s_namespace
  repository = "https://chartmuseum.github.io/charts"
  chart      = "chartmuseum"
  version    = var.chart_version_chartmuseum

  recreate_pods     = var.helm_recreate_pods
  atomic            = var.helm_atomic_creation
  cleanup_on_fail   = var.helm_cleanup_on_fail
  wait              = var.helm_wait_for_completion
  wait_for_jobs     = var.helm_wait_for_jobs
  timeout           = var.helm_timeout_seconds
  max_history       = var.helm_max_history
  verify            = var.helm_verify
  keyring           = var.helm_keyring
  reuse_values      = var.helm_reuse_values
  reset_values      = var.helm_reset_values
  force_update      = var.helm_force_update
  replace           = var.helm_replace
  create_namespace  = var.helm_create_namespace
  dependency_update = var.helm_dependency_update
  skip_crds         = var.helm_skip_crds

  values = [
    templatefile("${path.module}/helm-values/chartmuseum.yml.tftpl", {
      aws_region           = data.aws_region.current.name
      s3_bucket_name       = var.s3_bucket_name
      s3_object_key_prefix = var.s3_object_key_prefix
      k8s_sa_name          = var.k8s_sa_name
      iam_role_arn         = var.iam_role_arn
    })
  ]

}

