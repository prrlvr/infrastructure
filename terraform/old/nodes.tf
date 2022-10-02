resource "proxmox_vm_qemu" "k8s-master" {
  count = 1
  name        = "k8s-master-${count.index + 1}"
  target_node = "worker0"
  clone = "ubuntu-20.04-cloud"

  memory = 10 * 1024
  cores  = 4
  sockets = 1
  onboot = true
  agent = 1

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.11${count.index}/24"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "50G"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

resource "proxmox_vm_qemu" "k8s-node" {
  count = 2
  name        = "k8s-node-${count.index + 1}"
  target_node = "worker0"
  clone = "ubuntu-20.04-cloud"

  memory = 10 * 1024
  cores  = 4
  sockets = 1
  onboot = true
  agent = 1

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.12${count.index}/24"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "30G"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
