resource "proxmox_lxc" "tor-relay" {
  hostname    = "tor-relay"
  target_node = "worker0"
  ostemplate  = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  password    = "tor-relay"

  memory = 2 * 1024
  cores  = 4
  onboot = true

  ssh_public_keys   = <<EOF
  ${var.ssh_key}
  EOF

  rootfs {
    storage = "local-lvm"
    size    = "5G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.1.1"
    ip     = "192.168.1.150/24"
  }
}

