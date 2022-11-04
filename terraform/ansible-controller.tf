resource "proxmox_vm_qemu" "ansible" {
  name    = "ansible"
  target_node = "pve"
  clone       = "ubuntu-2204-cloudinit-template"

  memory = 1024 * 2
  cores  = 2
  sockets = 1
  onboot = true
  agent = 1

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.249/24"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "15G"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

