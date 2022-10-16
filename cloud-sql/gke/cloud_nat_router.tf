resource "google_compute_router_nat" "gke_cloud_nat" {
  project                = var.gcp_project_id
  name                   = "gke-cloud-nat"
  router                 = google_compute_router.gke_net_router.name
  region                 = var.gcp_region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_router" "gke_net_router" {
  name                   = "gke-router"
  network                = google_compute_network.vpc_network.name
  project                = var.gcp_project_id
  region                 = var.gcp_region
  }