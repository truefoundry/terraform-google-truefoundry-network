output "network_name" {
  value = var.shim == true ? var.network_name : google_compute_network.this[0].name
}

output "subnetwork_id" {
  value = var.shim == true ? var.subnetwork_id : google_compute_subnetwork.cluster[0].id
}