module "chartmuseum_iam" {
  source                      = "github.com/andreswebs/terraform-aws-eks-chartmuseum//modules/iam"
  cluster_oidc_provider       = var.eks_cluster_oidc_provider
  s3_bucket_name              = var.chartmuseum_s3_bucket_name
  k8s_namespace               = "flux-system"
  iam_role_name               = "chartmuseum-${var.eks_cluster_id}"
}