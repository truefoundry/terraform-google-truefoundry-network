output "network_id" {
  value       = var.use_existing_network ? var.network_id  : module.network[0].network_id
  description = "ID of the network"
}

output "subnet_id" {
  value       = var.use_existing_network ? var.subnet_id : module.network[0].subnets_ids[0]
  description = "ID of the subnet"
}