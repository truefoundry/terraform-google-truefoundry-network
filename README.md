# terraform-google-truefoundry-network
Truefoundry Google Cloud Network Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.12 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | 6.2.0 |
| <a name="module_network"></a> [network](#module\_network) | terraform-google-modules/network/google | 9.3.0 |

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait_2_mins](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | n/a | yes |
| <a name="input_enable_flow_logs"></a> [enable\_flow\_logs](#input\_enable\_flow\_logs) | Enable flow logs for subnets | `bool` | `false` | no |
| <a name="input_enable_private_access"></a> [enable\_private\_access](#input\_enable\_private\_access) | Private access for subnets | `bool` | `true` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | SHIM: network name | `string` | n/a | yes |
| <a name="input_network_vpc_secondary_ranges"></a> [network\_vpc\_secondary\_ranges](#input\_network\_vpc\_secondary\_ranges) | List of secondary ranges | <pre>list(object({<br/>    range_name    = string<br/>    ip_cidr_range = string<br/>  }))</pre> | n/a | yes |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | CIDR range for private subnet | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID in which clusters are deployed | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy your cluster in | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | Routing mode for the network | `string` | `"GLOBAL"` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | If true, the shim network is a shared VPC | `bool` | `false` | no |
| <a name="input_shared_vpc_host_project"></a> [shared\_vpc\_host\_project](#input\_shared\_vpc\_host\_project) | Shared VPC: Project ID of the host project | `string` | `""` | no |
| <a name="input_shared_vpc_network_name"></a> [shared\_vpc\_network\_name](#input\_shared\_vpc\_network\_name) | Shared VPC: Network name | `string` | `""` | no |
| <a name="input_shared_vpc_subnet_name"></a> [shared\_vpc\_subnet\_name](#input\_shared\_vpc\_subnet\_name) | Shared VPC: Subnet name | `string` | `""` | no |
| <a name="input_shim"></a> [shim](#input\_shim) | If true will not create the network and forward the input values to the same outputs. | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | SHIM: Subnetwork ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_secondary_ranges"></a> [additional\_secondary\_ranges](#output\_additional\_secondary\_ranges) | Additional secondary ranges applied to the subnet |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the network |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the network |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of the subnet |
<!-- END_TF_DOCS -->