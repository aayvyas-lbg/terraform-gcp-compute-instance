# terraform-gcp-compute-instance

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version      |
| ------------------------------------------------------------------------ | ------------ |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~>1.6        |
| <a name="requirement_google"></a> [google](#requirement_google)          | >= 3.71, < 6 |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider_google) | 5.10.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                        | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [google_compute_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource    |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network)         | data source |

## Inputs

| Name                                                                  | Description                                        | Type          | Default | Required |
| --------------------------------------------------------------------- | -------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_app_type"></a> [app_type](#input_app_type)             | must be either nodejs, spring-boot, flask, jenkins | `string`      | n/a     |   yes    |
| <a name="input_labels"></a> [labels](#input_labels)                   | Labels to apply to the instance                    | `map(string)` | n/a     |   yes    |
| <a name="input_machine_type"></a> [machine_type](#input_machine_type) | Machine type of the instance                       | `string`      | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)                         | Name of the Compute Engine instance                | `string`      | n/a     |   yes    |
| <a name="input_network"></a> [network](#input_network)                | Name of the VPC network to use                     | `string`      | n/a     |   yes    |
| <a name="input_size"></a> [size](#input_size)                         | Size of the boot disk in GB                        | `number`      | n/a     |   yes    |

## Outputs

| Name                                                                    | Description                                                  |
| ----------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_labels"></a> [labels](#output_labels)                   | The labels applied to the Compute Engine instance.           |
| <a name="output_machine_type"></a> [machine_type](#output_machine_type) | The machine type of the Compute Engine instance.             |
| <a name="output_name"></a> [name](#output_name)                         | The name of the Compute Engine instance.                     |
| <a name="output_subnetwork"></a> [subnetwork](#output_subnetwork)       | The subnetwork where the Compute Engine instance is located. |
| <a name="output_tags"></a> [tags](#output_tags)                         | The tags applied to the Compute Engine instance.             |

<!-- END_TF_DOCS -->
