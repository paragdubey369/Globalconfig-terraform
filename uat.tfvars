control_nodes = {
  node1 = {
    name        = "control-1"
    ip          = "172.20.0.100"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 104
    memory      = 8192
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node2 = {
    name        = "control-2"
    ip          = "172.20.0.101"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 102
    memory      = 8192
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node3 = {
    name        = "control-3"
    ip          = "172.20.0.102"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 103
    memory      = 8192
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}

worker_nodes = {
  node1 = {
    name        = "worker-1"
    ip          = "172.20.0.103"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 201
    memory      = 4096
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node2 = {
    name        = "worker-2"
    ip          = "172.20.0.104"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 202
    memory      = 4096
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node3 = {
    name        = "worker-3"
    ip          = "172.20.0.105"
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 203
    memory      = 4096
    cores       = 8
    disk_size   = "32G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
}
}

bastion_nodes = {
    node1 = {
    name = "bastion-1"
    ip = "172.20.0.110"
    gateway = "172.20.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id = 210
    memory = 4096
    cores = 8
    disk_size= "32G"
    template = "rhel-template"
    bridge = "vmbr0"
    storage = "local-lvm"
    node = "proxmox32"
}
}