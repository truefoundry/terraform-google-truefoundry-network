locals {
  network_name        = "${var.cluster_name}-vpc"
  router_name         = "${var.cluster_name}-router"
  private_subnet_name = "${local.network_name}-private"
  nat_name            = "${local.router_name}-nat"
  # tags = merge({
  #   "terraform-module" = "gcp"
  #   "terraform"        = "true"
  #   "cluster-name"     = var.cluster_name
  #   },
  #   var.tags
  # )
}