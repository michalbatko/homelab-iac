terraform {
  backend "gcs" {
    bucket = "homelab-iac-terraform-state"
  }
}
