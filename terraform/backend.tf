terraform {
  backend "gcs" {
    bucket = "homelab-iac-terraform-backend"
  }
}
