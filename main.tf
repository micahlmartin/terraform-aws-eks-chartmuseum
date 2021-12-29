/**
* Deploys [chartmuseum](https://chartmuseum.com) to AWS EKS.
*/

module "iam" {
  source                = "./modules/iam"
  cluster_oidc_provider = var.cluster_oidc_provider
  k8s_sa_name           = var.k8s_sa_name
  k8s_namespace         = var.k8s_namespace
  iam_role_name         = var.iam_role_name
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

  helm_release_name      = var.helm_release_name
  helm_recreate_pods     = var.helm_recreate_pods
  helm_atomic            = var.helm_atomic_creation
  helm_cleanup_on_fail   = var.helm_cleanup_on_fail
  helm_wait              = var.helm_wait_for_completion
  helm_wait_for_jobs     = var.helm_wait_for_jobs
  helm_timeout           = var.helm_timeout_seconds
  helm_max_history       = var.helm_max_history
  helm_verify            = var.helm_verify
  helm_keyring           = var.helm_keyring
  helm_reuse_values      = var.helm_reuse_values
  helm_reset_values      = var.helm_reset_values
  helm_force_update      = var.helm_force_update
  helm_replace           = var.helm_replace
  helm_create_namespace  = var.helm_create_namespace
  helm_dependency_update = var.helm_dependency_update
  helm_skip_crds         = var.helm_skip_crds

}
