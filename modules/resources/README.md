# terraform-aws-eks-chartmuseum resources

[//]: # (BEGIN_TF_DOCS)
Deploys the Chartmuseum Helm chart

## Usage

Example:

```hcl
module "chartmuseum_resources" {
  source                    = "github.com/andreswebs/terraform-aws-eks-chartmuseum//modules/resources"
  k8s_namespace             = "flux-system"
  s3_bucket_name            = var.chartmuseum_s3_bucket_name
  s3_object_key_prefix      = "charts/"
  iam_role_arn              = var.chartmuseum_iam_role_arn
  chart_version_chartmuseum = var.chart_version_chartmuseum
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version_chartmuseum"></a> [chart\_version\_chartmuseum](#input\_chart\_version\_chartmuseum) | Chart version | `string` | `null` | no |
| <a name="input_helm_atomic_creation"></a> [helm\_atomic\_creation](#input\_helm\_atomic\_creation) | Purge resources on installation failure ? The wait flag will be set automatically if atomic is used | `bool` | `true` | no |
| <a name="input_helm_cleanup_on_fail"></a> [helm\_cleanup\_on\_fail](#input\_helm\_cleanup\_on\_fail) | Deletion new resources created in this upgrade if the upgrade fails ? | `bool` | `true` | no |
| <a name="input_helm_max_history"></a> [helm\_max\_history](#input\_helm\_max\_history) | Maximum number of release versions stored per release; `0` means no limit | `number` | `3` | no |
| <a name="input_helm_recreate_pods"></a> [helm\_recreate\_pods](#input\_helm\_recreate\_pods) | Perform pods restart during upgrade/rollback ? | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Release name | `string` | `"chartmuseum"` | no |
| <a name="input_helm_timeout_seconds"></a> [helm\_timeout\_seconds](#input\_helm\_timeout\_seconds) | Time in seconds to wait for any individual kubernetes operation | `number` | `300` | no |
| <a name="input_helm_wait_for_completion"></a> [helm\_wait\_for\_completion](#input\_helm\_wait\_for\_completion) | Will wait until all resources are in a ready state before marking the release as successful ? | `bool` | `true` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | ARN of the IAM role used by the Chartmuseum service account | `string` | `""` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace on which to install Chartmuseum | `string` | `"flux-system"` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name of the Kubernetes service account used by Chartmuseum | `string` | `"chartmuseum"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of S3 bucket for chart storage | `string` | n/a | yes |
| <a name="input_s3_object_key_prefix"></a> [s3\_object\_key\_prefix](#input\_s3\_object\_key\_prefix) | Prefix added to S3 object names | `string` | `null` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_release"></a> [release](#output\_release) | Chartmuseum Helm release |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.46.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.2.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.46.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.3.2 |

## Resources

| Name | Type |
|------|------|
| [helm_release.chartmuseum](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

[//]: # (END_TF_DOCS)
