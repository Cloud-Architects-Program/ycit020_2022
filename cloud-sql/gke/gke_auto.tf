resource "google_container_cluster" "auto_cluster" {
  provider = google-beta
  project = var.gcp_project_id
  name               = format("gke-auto-%s-%s-%s", var.org, var.product, var.environment)
  min_master_version = var.kubernetes_version
  network            = google_compute_network.vpc_network.self_link
  subnetwork         = google_compute_subnetwork.gke_auto_subnet.self_link

  location                    = var.gcp_region
  logging_service             = var.logging_service
  monitoring_service          = var.monitoring_service

# Enable Autopilot for this cluster
  enable_autopilot = true

# Private Autopilot GKE cluster
  private_cluster_config {
    enable_private_nodes   = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block = var.auto_master_ipv4_cidr_block
  }

# Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    channel = "REGULAR"
  }

# Configuration of cluster IP allocation for VPC-native clusters
  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_auto_cidr_name
    services_secondary_range_name = var.services_auto_cidr_name
  }

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}