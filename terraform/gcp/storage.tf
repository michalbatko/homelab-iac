resource "google_storage_bucket" "terraform_backend" {
  name     = "homelab-iac-terraform-backend"
  location = "us-east1"

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

resource "google_storage_bucket" "vault_backend" {
  name     = "homelab-iac-vault-backend"
  location = "us-east1"

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

