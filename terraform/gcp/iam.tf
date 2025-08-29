resource "google_project_iam_member" "my_roles" {
  project = google_project.homelab_iac.project_id
  role    = "roles/owner"
  member  = "user:mibatko@gmail.com"
}

resource "google_service_account" "terraform" {
  project      = google_project.homelab_iac.project_id
  account_id   = "terraform"
  display_name = "Terraform"
  description  = "Service account used by Terraform to manage Google Cloud Platform"
}

resource "google_project_iam_member" "terraform_roles" {
  project = google_project.homelab_iac.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.terraform.email}"

  for_each = toset([
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
  ])
}

resource "google_service_account" "vault" {
  project      = google_project.homelab_iac.project_id
  account_id   = "hc-vault"
  display_name = "HashiCorp Vault"
  description  = "Service account used by HashiCorp Vault to access backend on GCS storage"
}

resource "google_storage_bucket_iam_member" "vault_roles" {
  bucket = google_storage_bucket.vault_backend.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.vault.email}"
}

resource "google_iam_workload_identity_pool" "github" {
  project                   = google_project.homelab_iac.project_id
  workload_identity_pool_id = "github"
}
