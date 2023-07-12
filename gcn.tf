resource "google_compute_network" "this" {
  count                   = var.shim == true ? 0 : 1
  name                    = "${var.cluster_name}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "cluster" {
  count         = var.shim == true ? 0 : 1
  name          = "${var.cluster_name}-vpc"
  ip_cidr_range = var.network_vpc_cidr
  network       = google_compute_network.this[0].id
  region        = var.region

  secondary_ip_range = var.network_vpc_secondary_ranges

  private_ip_google_access = true
}

resource "google_compute_address" "cluster" {
  count  = var.shim == true ? 0 : 1
  name   = "${var.cluster_name}-address"
  region = var.region
}

resource "google_compute_router" "cluster" {
  count   = var.shim == true ? 0 : 1
  name    = "${var.cluster_name}-router"
  network = google_compute_network.this[0].id
}

resource "google_compute_router_nat" "cluster" {
  count                              = var.shim == true ? 0 : 1
  router                             = google_compute_router.cluster[0].name
  name                               = "${var.cluster_name}-nat"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.cluster[0].self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.cluster[0].id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  depends_on = [google_compute_address.cluster[0]]
}

resource "google_compute_firewall" "cluster_allow_all" {
  count   = var.shim == true ? 0 : 1
  name    = "${var.cluster_name}-cluster-allow-all"
  network = google_compute_network.this[0].name

  allow {
    protocol = "tcp"
  }

  priority = 1000

  source_ranges = ["0.0.0.0/0"]
}