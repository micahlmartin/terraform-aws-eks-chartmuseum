variable "cluster_oidc_provider" {
  type        = string
  description = "OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster"
  default     = ""
}

variable "s3_bucket_name" {
  type        = string
  description = "Name of S3 bucket for chart storage"
}

variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace on which to install Chartmuseum"
  default     = "chartmuseum"
}

variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account used by Chartmuseum"
  default     = "chartmuseum"
}

variable "create_iam_role" {
  type        = bool
  description = "Create IAM role for Chartmuseum?"
  default     = true
}

variable "create_iam_managed_policies" {
  type        = bool
  description = "Create IAM managed policies for Chartmuseum?"
  default     = false
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name"
  default     = "chartmuseum"
}

variable "iam_role_allow_write" {
  type        = bool
  description = "Allow the chartmuseum IAM role to write to chartmuseum storage?"
  default     = false
}