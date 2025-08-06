module "proxmox" {
  source = "./proxmox"

  ansible_ssh_public_key = var.ansible_ssh_public_key
}
