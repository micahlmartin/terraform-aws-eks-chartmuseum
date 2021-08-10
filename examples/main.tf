module "chartmuseum" {
  source                    = "github.com/andreswebs/terraform-aws-eks-chartmuseum"
  cluster_oidc_provider     = var.eks_cluster_oidc_provider
  s3_bucket_name            = var.chartmuseum_s3_bucket_name
  s3_object_key_prefix      = "charts/"
  k8s_namespace             = "flux-system"
  iam_role_name             = "chartmuseum-${var.eks_cluster_id}"
  chart_version_chartmuseum = var.chart_version_chartmuseum
}
