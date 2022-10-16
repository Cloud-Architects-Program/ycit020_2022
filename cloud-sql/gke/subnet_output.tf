output "subnet_auto_selflink" {
  value = "${google_compute_subnetwork.gke_auto_subnet.self_link}"
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.id
  description = "full path to vpc"
}
output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
  description = "The URI of the created VPC"
}