# terraform-aws-eks-chartmuseum

[//]: # (BEGIN_TF_DOCS)
Deploys [chartmuseum](https://chartmuseum.com) to AWS EKS.

## Usage

Example:

```hcl
module "chartmuseum" {
  source                    = "github.com/andreswebs/terraform-aws-eks-chartmuseum"
  cluster_oidc_provider     = var.eks_cluster_oidc_provider
  s3_bucket_name            = var.chartmuseum_s3_bucket_name
  s3_object_key_prefix      = "charts/"
  k8s_namespace             = "flux-system"
  iam_role_name             = "chartmuseum-${var.eks_cluster_id}"
  chart_version_chartmuseum = var.chart_version_chartmuseum
}

```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version_chartmuseum"></a> [chart\_version\_chartmuseum](#input\_chart\_version\_chartmuseum) | Chart version | `string` | `null` | no |
| <a name="input_cluster_oidc_provider"></a> [cluster\_oidc\_provider](#input\_cluster\_oidc\_provider) | OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace on which to install Chartmuseum | `string` | n/a | yes |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name of the Kubernetes service account used by Chartmuseum | `string` | `"chartmuseum"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of S3 bucket for chart storage | `string` | n/a | yes |
| <a name="input_s3_object_key_prefix"></a> [s3\_object\_key\_prefix](#input\_s3\_object\_key\_prefix) | Prefix added to S3 object names | `string` | `null` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_resources"></a> [resources](#module\_resources) | ./modules/resources | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy"></a> [policy](#output\_policy) | Managed IAM policies for access to Chartmuseum storage |
| <a name="output_release"></a> [release](#output\_release) | Chartmuseum Helm release |
| <a name="output_role"></a> [role](#output\_role) | IAM role for Chartmuseum's Kubernetes service account |

## Providers

No providers.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.48.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.3.2 |

## Resources

No resources.

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
