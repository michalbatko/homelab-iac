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
