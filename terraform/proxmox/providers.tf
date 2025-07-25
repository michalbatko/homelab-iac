terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.80"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  insecure  = true
}
