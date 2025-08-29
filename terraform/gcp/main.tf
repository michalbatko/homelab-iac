resource "google_project" "homelab_iac" {
  name       = "homelab-iac"
  project_id = "homelab-iac"
}

resource "google_project_service" "required_apis" {
  service = each.value

  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com"
  ])

  disable_on_destroy = false
}
