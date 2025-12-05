module "automation" {
  source = "./automation"

  ansible_ssh_public_key = local.ansible_ssh_public_key
}

module "dns" {
  source = "./dns"

  ansible_ssh_public_key = local.ansible_ssh_public_key
}

module "proxy" {
  source = "./proxy"

  ansible_ssh_public_key = local.ansible_ssh_public_key
}

module "vault" {
  source = "./vault"

  ansible_ssh_public_key = local.ansible_ssh_public_key
}

module "web" {
  source = "./web"

  ansible_ssh_public_key = local.ansible_ssh_public_key
}
