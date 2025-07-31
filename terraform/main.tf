module "dns" {
  source = "./dns"

  ansible_ssh_public_key = var.ansible_ssh_public_key
  michal_ssh_public_key  = var.michal_ssh_public_key
}
