output "id" {
  value = google_project.project.project_id
  description = "GCP project ID"
}

output "number" {
  value = google_project.project.number
  description = "GCP project number"
  sensitive = true
}
output "bucket_name" {
  value = google_storage_bucket.state.name
}
