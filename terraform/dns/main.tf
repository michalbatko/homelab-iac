resource "proxmox_lxc" "dns" {
  target_node = "infra"
  vmid        = 100
  hostname    = "dns"
  description = "AdGuard Home DNS server"
  ostemplate  = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"

  cores        = 1
  memory       = 1024
  swap         = 512
  unprivileged = true
  start        = true

  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.100.20/24"
    gw     = "192.168.100.1"
  }

  features {
    nesting = true
  }
}
