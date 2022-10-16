variable "network_auto_cidr" {
  type = string
}
variable "pods_auto_cidr" {
  type = string
}
variable "pods_auto_cidr_name" {
  type    = string
  default = "gke-auto-pods"
}
variable "services_auto_cidr" {
  type = string
}
variable "services_auto_cidr_name" {
  type    = string
  default = "gke-auto-services"
}
variable "org" {
  type    = string
}
variable "product" {
  type    = string
}
variable "environment" {
  type    = string
}
variable "gcp_project_id" {
  type = string
}
variable "gcp_region" {
  type = string
}