terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 5"
    }
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.80"
    }
  }
}

provider "cloudflare" {
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  insecure  = true
}
