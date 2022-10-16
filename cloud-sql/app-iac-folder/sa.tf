module "service_accounts" {
  source = "terraform-google-modules/service-accounts/google"
  project_id    = var.project_id
  prefix        = "sa"
  names         = ["single-account"]
  project_roles = ["${var.project_id}=>roles/cloudsql.client"]
  display_name  = "GKE-CloudSQL Service Account"
  description   = "Service Account to connect GKE deployments to Cloud SQL Managed Instance"
}

