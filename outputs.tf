output "policy" {
  description = "Managed IAM policies for access to Chartmuseum storage"
  value       = module.iam.policy
}

output "role" {
  description = "IAM role for the Kubernetes service account"
  value       = module.iam.role
}

output "release" {
  description = "Helm release"
  value = module.resources.release
  sensitive = true
}

output "namespace" {
  value       = module.resources.namespace
  description = "The name (`metadata.name`) of the Kubernetes namespace"
}
