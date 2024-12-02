# # Create a VPC network

module "network" {
  count                   = var.use_existing_network ? 0 : 1
  source                  = "terraform-google-modules/network/google"
  version                 = "9.3.0"
  description             = "Truefoundry network for ${var.cluster_name}"
  project_id              = var.project_id
  network_name            = local.network_name
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name           = local.private_subnet_name
      subnet_ip             = var.private_subnet_cidr
      subnet_region         = var.region
      subnet_private_access = var.enable_private_access
      subnet_flow_logs      = var.enable_flow_logs
    }
  ]
  secondary_ranges = {
    # has to be passed in interpolation otherwise it give error
    # tflint-ignore: terraform_deprecated_interpolation
    "${local.private_subnet_name}" = var.network_vpc_secondary_ranges
  }
  ingress_rules = [
    {
      name          = "${local.network_name}-ingress-allow-http-https"
      description   = "Allow port 80 and 443"
      source_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["80", "443"]
        }
      ]
    },
    {
      name          = "${local.network_name}-ingress-allow-internal"
      description   = "Allow all ports inside a subnet"
      source_ranges = [var.private_subnet_cidr]
      allow = [
        {
          protocol = "tcp"
        }
      ]
    }
  ]
  egress_rules = [
    {
      name               = "${local.network_name}-egress-allow-all"
      description        = "Allow egress"
      source_ranges      = ["0.0.0.0/0"]
      destination_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
        },
        {
          protocol = "udp"
        }
      ]
    },
  ]
  routes = [
    {
      name              = "${local.network_name}-egress-internet"
      description       = "Route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
  shared_vpc_host = false
}

resource "time_sleep" "wait_2_mins" {
  count      = var.use_existing_network ? 0 : 1
  depends_on = [module.network[0]]

  create_duration = "2m"
}
module "cloud_router" {
  count       = var.use_existing_network ? 0 : 1
  source      = "terraform-google-modules/cloud-router/google"
  version     = "6.2.0"
  description = "Truefoundry NAT router for ${var.cluster_name}"
  name        = local.router_name
  project     = var.project_id
  region      = var.region
  network     = module.network[0].network_name
  nats = [
    {
      name                               = local.nat_name
      nat_ip_allocate_option             = "AUTO_ONLY"
      source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
      subnetworks = [
        {
          name                    = local.private_subnet_name
          source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
        }
      ]
      log_config = {
        enabled = true
        filter  = "ERRORS_ONLY"
      }
    }
  ]
  depends_on = [time_sleep.wait_2_mins]
}