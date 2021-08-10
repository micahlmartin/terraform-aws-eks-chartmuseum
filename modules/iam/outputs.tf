output "policy" {
  description = "Managed IAM policies for access to Chartmuseum storage"
  value = {
    storage_read      = var.create_iam_managed_policies ? aws_iam_policy.storage_read[0] : null
    storage_readwrite = var.create_iam_managed_policies ? aws_iam_policy.storage_readwrite[0] : null
  }
}

output "role" {
  description = "IAM role for the Kubernetes service account"
  value = var.create_iam_role ? aws_iam_role.chartmuseum[0] : null
}
