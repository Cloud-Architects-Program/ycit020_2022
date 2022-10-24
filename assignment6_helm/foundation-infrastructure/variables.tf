variable "gcp_region" {
  type        = string
  description = "The GCP Region"
  default     = "us-central1"
}

variable "gcp_project_id" {
  type        = string
  description = "The GCP Seeding project ID"
  default     = ""
}
variable "billing_account" {
  description = "The billing account ID for this project"
}

variable "project_name" {
  description = "The human readable project name (min 4 letters)"
}
variable "auto_create_network" {
  description = "Automatically provision a default global VPC network"
  default     = false
}
variable "bucket_name" {
  description = "The name of the bucket."
  default = "tfstate"
}

variable "storage_class" {
  description = "The Storage Class of the new bucket"
  default = "MULTI_REGIONAL"
}
