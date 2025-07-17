control_nodes = {
  node1 = {
    name        = "control-1"
    ip          = "priv-172-17-0-100.local"
    gateway     = "priv-172-20-0-1.local"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 104
    memory      = 8192
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}
galera_cluster_nocc = {
  nocc_node1 = {
    name        = "mariabd01"
    ip          = "priv-172-17-0-104.local"
    server_id   = 1
    gtid_domain_id = 104
    gateway     = "priv-172-20-0-1.local"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 108
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}

haproxy_nodes = {
  primary_group = {
    name        = "haproxy-primary"
    ip          = "priv-172-17-0-106.local"
    primary_ha =  "haproxy1"
    gateway     = "priv-172-20-0-1.local"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 106
    memory      = 4096
    cores       = 2
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}


hauler_vm = {
  hauler = {
    name = "Hauler-1"
    ip = "priv-172-17-0-20.local"
    gateway = "priv-172-20-0-1.local"
    dns_servers = ["1.1.1.1"]
    vm_id = 150
    memory = 16384
    cores = 4
    disk_size= "200G"
    template = "hauler-template"
    bridge = "vmbr1"
    storage = "local-lvm"
    node = "proxmox32"
}
}
bastion_nodes = {
    node1 = {
    name = "bastion-1"
    ip = "priv-172-17-0-110.local"
    gateway = "priv-172-20-0-1.local"
    dns_servers = ["1.1.1.1"]
    vm_id = 210
    memory = 4096
    cores = 8
    disk_size= "32G"
    template = "rhel"
    bridge = "vmbr1"
    storage = "local-lvm"
    node = "proxmox32"
}
}
