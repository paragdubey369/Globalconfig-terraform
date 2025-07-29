environment_type = "uat"
control_nodes = {
  node1 = {
    name        = "control-1"
    ip          = "172.17.0.21"
    gateway     = "172.17.0.1"
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
  node2 = {
    name        = "control-2"
    ip          = "172.17.0.22"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 102
    memory      = 8192
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node3 = {
    name        = "control-3"
    ip          = "172.17.0.23"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 103
    memory      = 8192
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}

worker_nodes = {
  node1 = {
    name        = "worker-1"
    ip          = "172.17.0.24"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 201
    memory      = 4096
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node2 = {
    name        = "worker-2"
    ip          = "172.17.0.25"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 202
    memory      = 4096
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  node3 = {
    name        = "worker-3"
    ip          = "172.17.0.26"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id       = 203
    memory      = 4096
    cores       = 8
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
}
}

bastion_nodes = {
    node1 = {
    name = "bastion-1"
    ip = "172.17.0.27"
    gateway = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id = 210
    memory = 4096
    cores = 8
    disk_size= "40G"
    template = "rhel"
    bridge = "vmbr1"
    storage = "local-lvm"
    node = "proxmox32"
}
}


galera_cluster_nocc = {
  nocc_node1 = {
    name        = "mariadb01"
    ip          = "172.17.0.28"
    server_id   = 1
    gtid_domain_id = 104
    gateway     = "172.17.0.1"
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
  nocc_node2  = {
    name        = "mariadb02"
    ip          = "172.17.0.29"
    gateway     = "172.17.0.1"
    server_id   = 1
    gtid_domain_id = 105
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 105
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  nocc_node3 = {
    name        = "mariadb03"
    ip          = "172.17.0.30"
    gateway     = "172.17.0.1"
    server_id   = 1
    gtid_domain_id = 106
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 106
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}


maxscale_servers = {
   maxscale_nocc = {
    name = "maxscale01"
    ip = "172.17.0.31"
    gateway = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id = 107
    memory = 4096
    cores = 2
    disk_size= "40G"
    template = "rhel"
    bridge = "vmbr1"
    storage = "local-lvm"
    node = "proxmox32"
}
}

haproxy_nodes = {
  primary_group = {
    name        = "haproxy-primary"
    ip          = "172.17.0.32"
    primary_ha =  "haproxy1"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 109
    memory      = 4096
    cores       = 2
    disk_size   = "40G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  secondary_group  = {
    name        = "haproxy-secondary"
    ip          = "172.17.0.33"
    primary_ha =  "haproxy2"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 110
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
    ip = "172.17.0.20"
    gateway = "172.17.0.1"
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
