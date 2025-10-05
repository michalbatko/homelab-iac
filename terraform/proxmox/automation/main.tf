resource "proxmox_virtual_environment_container" "automation01" {
  description = "Ansible, GitHub Actions Runner, Terraform"
  node_name   = "infra01"
  vm_id       = 102

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
    swap      = 512
  }

  disk {
    datastore_id = "local-lvm"
    size         = 16
  }

  network_interface {
    name     = "eth0"
    firewall = true
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type             = "debian"
  }

  initialization {
    hostname = "automation01"
    ip_config {
      ipv4 {
        address = "192.168.100.22/24"
        gateway = "192.168.100.1"
      }
    }
    dns {
      domain = "home.batko.me"
      servers = [
        "192.168.100.20",
        "192.168.100.21"
      ]
    }
    user_account {
      keys = [
        var.ansible_ssh_public_key
      ]
    }
  }

  unprivileged = true

  features {
    nesting = true
  }

  lifecycle {
    ignore_changes = [
      initialization,
      operating_system
    ]
  }

  tags = []
}

resource "proxmox_virtual_environment_container" "automation02" {
  description = "Ansible, GitHub Actions Runner, Terraform"
  node_name   = "infra01"
  vm_id       = 103

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
    swap      = 512
  }

  disk {
    datastore_id = "local-lvm"
    size         = 16
  }

  network_interface {
    name     = "eth0"
    firewall = true
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type             = "debian"
  }

  initialization {
    hostname = "automation02"
    ip_config {
      ipv4 {
        address = "192.168.100.23/24"
        gateway = "192.168.100.1"
      }
    }
    dns {
      domain = "home.batko.me"
      servers = [
        "192.168.100.20",
        "192.168.100.21"
      ]
    }
    user_account {
      keys = [
        var.ansible_ssh_public_key
      ]
    }
  }

  unprivileged = true

  features {
    nesting = true
  }

  tags = []
}
