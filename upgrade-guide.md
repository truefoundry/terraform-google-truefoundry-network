# terraform-aws-truefoundry-cluster
This guide will help you to migrate your terraform code across versions. Keeping your terraform state to the latest version is always recommeneded

# Upgrade guide from v0.1.x to v0.2.x
1. Ensure that you are running on the latest version of v0.1.x
2. Move to v0.2.0
3. Following variables are removed
- `shim` - replaced by `use_existing_network`
- `shared_vpc` - removed in support of `network_id` and `subnet_id`
- `shared_vpc_host_project` - removed in support of `network_id` and `subnet_id`
- `shared_vpc_network_name` - removed in support of `network_id` and `subnet_id`
- `shared_vpc_subnet_name` - removed in support of `network_id` and `subnet_id`
- `network_name` - removed in support of `network_id` and `subnet_id`
4. Following outputs are removed
- `network_name`
- `additional_secondary_ranges`
