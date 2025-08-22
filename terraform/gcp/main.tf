resource "google_project" "homelab_iac" {
  name       = "homelab-iac"
  project_id = "homelab-iac"
}

resource "google_project_service" "cloudresourcemanager" {
  project = google_project.homelab_iac.project_id
  service = "cloudresourcemanager.googleapis.com"
}
