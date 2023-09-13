output "network_name" {
  value = var.shim ? var.network_name : module.network[0].network_name
}

output "network_id" {
  value = var.shim ? data.google_compute_network.gcn[0].id : module.network[0].network_id
}

output "subnet_id" {
  value = var.shim ? var.subnet_id : module.network[0].subnets_ids[0]
} 