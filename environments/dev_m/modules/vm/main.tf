terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc9"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_config.name
  target_node = var.vm_config.node
  vmid        = var.vm_config.vm_id
  
  memory      = var.vm_config.memory
  cpu {
  sockets     = 1
  cores       = var.vm_config.cores
  }

  disk {
    size          = var.vm_config.disk_size
    type          = "disk"
    storage       = var.vm_config.storage
    
    slot = "scsi0"
  }

  network {
    id = 0
    model  = "virtio"
    bridge = var.vm_config.bridge
  }

  clone      = var.vm_config.template
  full_clone = true
  os_type    = "cloud-init"

  ipconfig0  = "ip=${var.vm_config.ip}/24,gw=${var.vm_config.gateway}"
  nameserver = join(" ", var.vm_config.dns_servers)

  ciuser  = "ubuntu"
  sshkeys = file("${path.module}/ssh.txt")

  
  lifecycle {                                    # this is introduced so that proxmox do not modify anything on its own 
    ignore_changes = [network, disk]
  }

}

