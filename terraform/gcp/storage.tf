resource "google_storage_bucket" "terraform_state" {
  name     = "homelab-iac-terraform-state"
  location = "US"
  project  = google_project.homelab_iac.project_id

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 10
    }
  }

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}
