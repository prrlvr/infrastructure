resource "proxmox_vm_qemu" "yocto" {
  name    = "yocto"
  target_node = "pve"
  clone       = "ubuntu-2204-cloudinit-template"

  memory = 28 * 1024
  cores  = 22
  sockets = 1
  onboot = false
  agent = 1

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.211/24"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "115G"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

