control_nodes = {
  node1 = {
    name        = "control-1"
    ip          = "priv-172-20-0-100.local"
    gateway     = "priv-172-20-0-1.local"
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
    ip          = "priv-172-20-0-101.local"
    gateway     = "priv-172-20-0-1.local"
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
    ip          = "priv-172-20-0-102.local"
    gateway     = "priv-172-20-0-1.local"
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

bastion_nodes = {
    node1 = {
    name = "bastion-1"
    ip = "priv-172-20-0-110.local"
    gateway = "priv-172-20-0-1.local"
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