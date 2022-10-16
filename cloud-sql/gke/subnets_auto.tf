resource "google_compute_network" "vpc_network" {
  name                    = format("vpc-%s-%s-%s",var.org, var.product, var.environment)
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
  project                 = var.gcp_project_id
}

resource "google_compute_subnetwork" "gke_auto_subnet" {
  name          = format("gke-auto-%s-%s-%s-subnet", var.org, var.product, var.environment)
  network       = google_compute_network.vpc_network.self_link
  region        = var.gcp_region
  project       = var.gcp_project_id
  ip_cidr_range = var.network_auto_cidr
  secondary_ip_range {
    range_name    = var.pods_auto_cidr_name
    ip_cidr_range = var.pods_auto_cidr
  }
  secondary_ip_range {
    range_name    = var.services_auto_cidr_name
    ip_cidr_range = var.services_auto_cidr
  }
}