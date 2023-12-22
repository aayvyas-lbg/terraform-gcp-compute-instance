# terraform-gcp-compute-instance
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.71, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_type"></a> [app\_type](#input\_app\_type) | must be either nodejs, spring-boot, flask, jenkins | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the instance | `map(string)` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type of the instance | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Compute Engine instance | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | Name of the VPC network to use | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Size of the boot disk in GB | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_labels"></a> [labels](#output\_labels) | n/a |
| <a name="output_machine_type"></a> [machine\_type](#output\_machine\_type) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
<!-- END_TF_DOCS -->