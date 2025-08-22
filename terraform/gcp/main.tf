resource "google_project" "homelab_iac" {
  name       = "homelab-iac"
  project_id = "homelab-iac"
}

resource "google_project_service" "required_apis" {
  for_each = local.required_apis

  project = google_project.homelab_iac.project_id
  service = each.value

  disable_on_destroy = false
}
