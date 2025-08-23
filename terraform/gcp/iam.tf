resource "google_service_account" "terraform" {
  account_id   = "terraform"
  display_name = "Terraform"
  description  = "Service account used by Terraform to manage Google Cloud Platform"
  project      = google_project.homelab_iac.project_id
}

resource "google_project_iam_binding" "owners" {
  project = google_project.homelab_iac.project_id
  role    = "roles/owner"

  members = [
    "serviceAccount:terraform@homelab-iac.iam.gserviceaccount.com",
    "user:mibatko@gmail.com",
  ]
}
