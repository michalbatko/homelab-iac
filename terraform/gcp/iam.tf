resource "google_project_iam_member" "my_roles" {
  project = google_project.homelab_iac.project_id
  role    = "roles/owner"
  member  = "user:mibatko@gmail.com"
}

resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "GitHub"
  description                        = "GitHub Actions identity pool provider"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }

  attribute_condition = "attribute.repository == '${local.github_repository}'"
}

resource "google_service_account" "terraform" {
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
    "roles/iam.workloadIdentityPoolAdmin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
  ])
}

resource "google_service_account_iam_member" "terraform_workload_identity" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${google_project.homelab_iac.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github.workload_identity_pool_id}/attribute.repository/${local.github_repository}"
}

resource "google_service_account" "vault" {
  account_id   = "hc-vault"
  display_name = "HashiCorp Vault"
  description  = "Service account used by HashiCorp Vault to access backend on GCS storage"
}

resource "google_storage_bucket_iam_member" "vault_roles" {
  bucket = google_storage_bucket.vault_backend.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.vault.email}"
}
