module "automation" {
  source = "./automation"

  ansible_ssh_public_key = var.ansible_ssh_public_key
}

module "dns" {
  source = "./dns"

  ansible_ssh_public_key = var.ansible_ssh_public_key
}
