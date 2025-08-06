module "cloudflare" {
  source = "./cloudflare"
}

module "gcp" {
  source = "./gcp"
}

module "proxmox" {
  source = "./proxmox"
}
