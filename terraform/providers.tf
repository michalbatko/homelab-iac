terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0"
    }
  }
}

provider "cloudflare" {
}

provider "google" {
  project = local.gcp_project_id
}

provider "proxmox" {
  endpoint = local.proxmox_endpoint
  insecure = true
}
