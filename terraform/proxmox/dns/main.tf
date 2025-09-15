resource "proxmox_virtual_environment_container" "dns" {
  description = "Bind9"
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
    name     = "eth0"
    firewall = true
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
    dns {
      domain = "home.batko.me"
      servers = [
        "192.168.100.20",
        "192.168.100.24"
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

resource "proxmox_virtual_environment_container" "dns02" {
  description = "Bind9"
  node_name   = "infra"
  vm_id       = 104

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
    hostname = "dns02"
    ip_config {
      ipv4 {
        address = "192.168.100.24/24"
        gateway = "192.168.100.1"
      }
    }
    dns {
      domain = "home.batko.me"
      servers = [
        "192.168.100.24",
        "192.168.100.20"
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

