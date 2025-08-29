module "cloudflare" {
  source = "./cloudflare"
}

module "gcp" {
  source     = "./gcp"
  project_id = local.gcp_project_id
}

module "proxmox" {
  source = "./proxmox"
}
