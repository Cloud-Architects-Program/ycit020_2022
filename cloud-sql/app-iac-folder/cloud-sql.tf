

resource "random_id" "suffix" {
  byte_length = 5
}

locals {

  network_name = "${var.network_name}-safer-${random_id.suffix.hex}"
}

module "sql-db" {
  source  = "GoogleCloudPlatform/sql-db/google"
  version = "12.1.0"
}

module "network-safer-mysql-simple" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = local.network_name

  subnets = []
}

module "private-service-access" {
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  project_id  = var.project_id
  vpc_network = module.network-safer-mysql-simple.network_name
}

module "safer-mysql-db" {
 source               = "GoogleCloudPlatform/sql-db/google//modules/safer_mysql"
  name                 = var.db_name
  random_instance_name = true
  project_id           = var.project_id

  deletion_protection = false

  database_version = "MYSQL_5_6"
  region           = "us-central1"
  zone             = "us-central1-c"
  tier             = "db-n1-standard-1"

  // By default, all users will be permitted to connect only via the
  // Cloud SQL proxy.
  additional_databases = [ {
      name     = "quickstart-db"
      charset  = ""
      collation = ""
    }
  ]
  additional_users = [
    {
      name     = "quickstart-user"
      password = "PaSsWoRd"
      host     = ""
      type     = "BUILT_IN"
    }
  ]

  assign_public_ip   = "true"
  vpc_network        = module.network-safer-mysql-simple.network_self_link
  allocated_ip_range = module.private-service-access.google_compute_global_address_name

  // Optional: used to enforce ordering in the creation of resources.
  module_depends_on = [module.private-service-access.peering_completed]
}

