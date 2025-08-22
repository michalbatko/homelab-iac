resource "google_service_account" "terraform" {
  account_id   = "terraform"
  display_name = "Terraform"
  description  = "Service account used by Terraform to manage Google Cloud Platform"
  project      = google_project.homelab_iac.project_id
}
