module "chartmuseum_resources" {
  source                    = "github.com/andreswebs/terraform-aws-eks-chartmuseum//modules/resources"
  k8s_namespace             = "flux-system"
  s3_bucket_name            = var.chartmuseum_s3_bucket_name
  s3_object_key_prefix      = "charts/"
  iam_role_arn              = var.chartmuseum_iam_role_arn
  chart_version_chartmuseum = var.chart_version_chartmuseum
}