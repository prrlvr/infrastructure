resource "proxmox_vm_qemu" "master1" {
  name        = "k8s-master-1"
  target_node = "worker0"

  clone = "ubuntu-20.04-cloud"

  memory = 6 * 1024
  cores  = 4

  onboot = true

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.110/24"
  sshkeys   = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEq2QxSFLhEUFrzia7adCgtd5SBMCgcC9S3ZAX/kvEl42F4+QIGJt4lUeiHUPZviIGb/wloElJaEXnCxiV0JnC2UoFTdDPuceybZciQ+CHa/Hr6t4xLC85Z3K2CKR/ezhh+FaQ7prWT0yyUAYIzclITl5f1KYHkCWn91b4u0lI8CbtOJzbu1MCkegTPPoWFSa0cE4R8g36uEYOhE/s/aKjDlz4c5fhwzyoY8+Qc5/MVuwLNuVguxqlYT3eZOWPCv5+q3dwWFWMaj1hRpvX3Bbfm8A3rv/iros1+FZihbrmWvUgdUp3uhs5ROU1nXiMF2dBE1XCj6trHt0728ploknOqg7xjbfJ5QgfkRRpgehQWd6ybT/iD6MNqa3Alo577iPgr9lVTqiCprI0To8bVgfLAkAMnoGGgH4Dd3NMW7QxFjC8kBmlbFACJenN3Xrtvih89excrk98bFii5YpHMZ8Y/hx1x+5kFtFxFwfLh9XKFCv/DQDT0u4IR5L7o3pIc5yQgN6+G5s59206DCqrN+65ntNJWdsjUC2D5hgunkQOcQMONacTemyi9ct/QmQ13WP/FQzqZlVVu/uOVlifw6Ps+I3qhjaY5s3YROf+9X74TmS5waOpX01ZL9NxB6eQ4MN8TLICPEL1BvbEzPa/33N5Wb5IfoflY77tVyXq8WdUIw== ayanami
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

resource "proxmox_vm_qemu" "node1" {
  name        = "k8s-node-1"
  target_node = "worker0"

  clone = "ubuntu-20.04-cloud"

  memory = 10 * 1024
  cores  = 4

  onboot = true

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.120/24"
  sshkeys   = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEq2QxSFLhEUFrzia7adCgtd5SBMCgcC9S3ZAX/kvEl42F4+QIGJt4lUeiHUPZviIGb/wloElJaEXnCxiV0JnC2UoFTdDPuceybZciQ+CHa/Hr6t4xLC85Z3K2CKR/ezhh+FaQ7prWT0yyUAYIzclITl5f1KYHkCWn91b4u0lI8CbtOJzbu1MCkegTPPoWFSa0cE4R8g36uEYOhE/s/aKjDlz4c5fhwzyoY8+Qc5/MVuwLNuVguxqlYT3eZOWPCv5+q3dwWFWMaj1hRpvX3Bbfm8A3rv/iros1+FZihbrmWvUgdUp3uhs5ROU1nXiMF2dBE1XCj6trHt0728ploknOqg7xjbfJ5QgfkRRpgehQWd6ybT/iD6MNqa3Alo577iPgr9lVTqiCprI0To8bVgfLAkAMnoGGgH4Dd3NMW7QxFjC8kBmlbFACJenN3Xrtvih89excrk98bFii5YpHMZ8Y/hx1x+5kFtFxFwfLh9XKFCv/DQDT0u4IR5L7o3pIc5yQgN6+G5s59206DCqrN+65ntNJWdsjUC2D5hgunkQOcQMONacTemyi9ct/QmQ13WP/FQzqZlVVu/uOVlifw6Ps+I3qhjaY5s3YROf+9X74TmS5waOpX01ZL9NxB6eQ4MN8TLICPEL1BvbEzPa/33N5Wb5IfoflY77tVyXq8WdUIw== ayanami
  EOF

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}


resource "proxmox_vm_qemu" "node2" {
  name        = "k8s-node-2"
  target_node = "worker0"

  clone = "ubuntu-20.04-cloud"

  memory = 10 * 1024
  cores  = 4

  onboot = true

  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.121/24"
  sshkeys   = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEq2QxSFLhEUFrzia7adCgtd5SBMCgcC9S3ZAX/kvEl42F4+QIGJt4lUeiHUPZviIGb/wloElJaEXnCxiV0JnC2UoFTdDPuceybZciQ+CHa/Hr6t4xLC85Z3K2CKR/ezhh+FaQ7prWT0yyUAYIzclITl5f1KYHkCWn91b4u0lI8CbtOJzbu1MCkegTPPoWFSa0cE4R8g36uEYOhE/s/aKjDlz4c5fhwzyoY8+Qc5/MVuwLNuVguxqlYT3eZOWPCv5+q3dwWFWMaj1hRpvX3Bbfm8A3rv/iros1+FZihbrmWvUgdUp3uhs5ROU1nXiMF2dBE1XCj6trHt0728ploknOqg7xjbfJ5QgfkRRpgehQWd6ybT/iD6MNqa3Alo577iPgr9lVTqiCprI0To8bVgfLAkAMnoGGgH4Dd3NMW7QxFjC8kBmlbFACJenN3Xrtvih89excrk98bFii5YpHMZ8Y/hx1x+5kFtFxFwfLh9XKFCv/DQDT0u4IR5L7o3pIc5yQgN6+G5s59206DCqrN+65ntNJWdsjUC2D5hgunkQOcQMONacTemyi9ct/QmQ13WP/FQzqZlVVu/uOVlifw6Ps+I3qhjaY5s3YROf+9X74TmS5waOpX01ZL9NxB6eQ4MN8TLICPEL1BvbEzPa/33N5Wb5IfoflY77tVyXq8WdUIw== ayanami
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
