output "policy" {
  description = "Managed IAM policies for access to Chartmuseum storage"
  value       = module.iam.policy
}

output "role" {
  description = "IAM role for Chartmuseum's Kubernetes service account"
  value       = module.iam.role
}

output "release" {
  description = "Chartmuseum Helm release"
  value = module.resources.release
}