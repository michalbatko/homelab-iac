variable "ansible_ssh_public_key" {
  description = "Public SSH key added at initial provisioning to allow Ansible management"
  type        = string
}

variable "michal_ssh_public_key" {
  description = "Public SSH key added at initial provisioning to allow connection from MICHAL-WL.batko.me"
  type        = string
}

variable "proxmox_endpoint" {
  description = "URL to the Proxmox VE"
  type        = string
}
