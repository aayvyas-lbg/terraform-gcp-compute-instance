# terraform-gcp-compute-instance

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~>1.6)

- <a name="requirement_google"></a> [google](#requirement\_google) (>= 3.71, < 6)

## Providers

The following providers are used by this module:

- <a name="provider_google"></a> [google](#provider\_google) (5.10.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [google_compute_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) (resource)
- [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_app_type"></a> [app\_type](#input\_app\_type)

Description: must be either nodejs, spring-boot, flask, jenkins

Type: `string`

### <a name="input_labels"></a> [labels](#input\_labels)

Description: Labels to apply to the instance

Type: `map(string)`

### <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type)

Description: Machine type of the instance

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Compute Engine instance

Type: `string`

### <a name="input_network"></a> [network](#input\_network)

Description: Name of the VPC network to use

Type: `string`

### <a name="input_size"></a> [size](#input\_size)

Description: Size of the boot disk in GB

Type: `number`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_labels"></a> [labels](#output\_labels)

Description: The labels applied to the Compute Engine instance.

### <a name="output_machine_type"></a> [machine\_type](#output\_machine\_type)

Description: The machine type of the Compute Engine instance.

### <a name="output_name"></a> [name](#output\_name)

Description: The name of the Compute Engine instance.

### <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork)

Description: The subnetwork where the Compute Engine instance is located.

### <a name="output_tags"></a> [tags](#output\_tags)

Description: The tags applied to the Compute Engine instance.
<!-- END_TF_DOCS -->
