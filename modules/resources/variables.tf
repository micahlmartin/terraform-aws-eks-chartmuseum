variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace on which to install Chartmuseum"
  default     = "flux-system"
}

variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account used by Chartmuseum"
  default     = "chartmuseum"
}

variable "s3_bucket_name" {
  type        = string
  description = "Name of S3 bucket for chart storage"
}

variable "s3_object_key_prefix" {
  type        = string
  description = "Prefix added to S3 object names"
  default     = null
}

variable "iam_role_arn" {
  type        = string
  description = "ARN of the IAM role used by the Chartmuseum service account"
  default     = ""
}

variable "chart_version_chartmuseum" {
  type        = string
  description = "Chart version"
  default     = null
}
