terraform {
  backend "gcs" {
    bucket = "course-valavan-tfstate"
  #  prefix = var.env
  }
}