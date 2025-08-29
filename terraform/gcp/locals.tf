locals {
  required_apis = toset([
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com"
  ])
  
  github_repository = "michalbatko/homelab-iac"
}
