# terraform-aws-eks-chartmuseum iam

[//]: # (BEGIN_TF_DOCS)
Deploys IAM resources for Chartmuseum:
- Chartmuseum IAM role for the Kubernetes service account
- managed IAM policies for access to Charmuseum storage

## Usage

Example:

```hcl
module "chartmuseum_iam" {
  source                      = "github.com/andreswebs/terraform-aws-eks-chartmuseum//modules/iam"
  cluster_oidc_provider       = var.eks_cluster_oidc_provider
  s3_bucket_name              = var.chartmuseum_s3_bucket_name
  k8s_namespace               = "flux-system"
  iam_role_name               = "chartmuseum-${var.eks_cluster_id}"
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_oidc_provider"></a> [cluster\_oidc\_provider](#input\_cluster\_oidc\_provider) | OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster | `string` | `""` | no |
| <a name="input_create_iam_managed_policies"></a> [create\_iam\_managed\_policies](#input\_create\_iam\_managed\_policies) | Create IAM managed policies for Chartmuseum? | `bool` | `false` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Create IAM role for Chartmuseum? | `bool` | `true` | no |
| <a name="input_iam_role_allow_write"></a> [iam\_role\_allow\_write](#input\_iam\_role\_allow\_write) | Allow the chartmuseum IAM role to write to chartmuseum storage? | `bool` | `false` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | IAM role name | `string` | `"chartmuseum"` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace on which to install Chartmuseum | `string` | `"chartmuseum"` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name of the Kubernetes service account used by Chartmuseum | `string` | `"chartmuseum"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of S3 bucket for chart storage | `string` | n/a | yes |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_assume_role_policy"></a> [assume\_role\_policy](#module\_assume\_role\_policy) | andreswebs/eks-irsa-policy-document/aws | 1.0.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy"></a> [policy](#output\_policy) | Managed IAM policies for access to Chartmuseum storage |
| <a name="output_role"></a> [role](#output\_role) | IAM role for the Kubernetes service account |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.48.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.storage_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.storage_readwrite](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.storage_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.storage_readwrite](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

[//]: # (END_TF_DOCS)
