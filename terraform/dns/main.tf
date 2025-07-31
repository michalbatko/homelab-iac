resource "proxmox_virtual_environment_container" "dns" {
  description = "AdGuard Home DNS"
  node_name   = "infra"
  vm_id       = 100

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
    name = "eth0"
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type             = "debian"
  }

  initialization {
    hostname = "dns"
    ip_config {
      ipv4 {
        address = "192.168.100.20/24"
        gateway = "192.168.100.1"
      }
    }
    user_account {
      keys = [
        var.ansible_ssh_public_key,
        var.michal_ssh_public_key
      ]
    }
  }

  unprivileged = true

  features {
    nesting = true
  }

  tags = []
}
