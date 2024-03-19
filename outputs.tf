output "network_name" {
  value       = var.shim || var.shared_vpc ? var.shared_vpc ? var.shared_vpc_network_name : var.network_name : module.network[0].network_name
  description = "Name of the network"
}

output "network_id" {
  value       = var.shim || var.shared_vpc ? var.shared_vpc ? "projects/${var.shared_vpc_host_project}/global/networks/${var.shared_vpc_network_name}" : "projects/${var.project_id}/global/networks/${var.network_name}" : module.network[0].network_id
  description = "ID of the network"
}

output "subnet_id" {
  value       = var.shim || var.shared_vpc ? var.shared_vpc ? "projects/${var.shared_vpc_host_project}/regions/${var.region}/subnetworks/${var.shared_vpc_subnet_name}" : var.subnet_id : module.network[0].subnets_ids[0]
  description = "ID of the subnet"
}

output "additional_secondary_ranges" {
  value       = var.shim || var.shared_vpc ? var.shared_vpc ? [] : [] : module.network[0].subnets_secondary_ranges
  description = "Additional secondary ranges applied to the subnet"
}