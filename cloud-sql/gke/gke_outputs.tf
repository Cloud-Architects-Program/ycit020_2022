output "id" {
  value = "${google_container_cluster.auto_cluster.id}"
}
output "endpoint" {
  value = "${google_container_cluster.auto_cluster.endpoint}"
}
output "master_version" {
  value = "${google_container_cluster.auto_cluster.master_version}"
}

output "gke_cluster_name" {
  value = "${google_container_cluster.auto_cluster.name}"
}
