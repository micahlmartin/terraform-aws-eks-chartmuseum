# terraform-aws-eks-chartmuseum resources

[//]: # (BEGIN_TF_DOCS)
Helm resources

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
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | ARN of the IAM role used by the Chartmuseum service account | `string` | `""` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace on which to install Chartmuseum | `string` | `"flux-system"` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name of the Kubernetes service account used by Chartmuseum | `string` | `"chartmuseum"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of S3 bucket for chart storage | `string` | n/a | yes |
| <a name="input_s3_object_key_prefix"></a> [s3\_object\_key\_prefix](#input\_s3\_object\_key\_prefix) | Prefix added to S3 object names | `string` | `null` | no |

## Modules

No modules.

## Outputs

No outputs.

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
