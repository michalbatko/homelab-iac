terraform {
  backend "local" {
    path = "/opt/terraform/homelab-iac/terraform.tfstate"
  }
}
