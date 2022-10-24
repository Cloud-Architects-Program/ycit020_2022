terraform {
  backend "gcs" {
    bucket = "<STUDENT_NAME>-notepad-dev-tfstate"
    prefix = "state"
  }
}
