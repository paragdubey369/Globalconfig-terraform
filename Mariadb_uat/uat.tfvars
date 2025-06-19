environment_type = "uat"

galera_cluster_nocc = {
  nocc_node1 = {
    name        = "mariabd01"
    ip          = "172.20.0.108"
    server_id   = 1
    gtid_domain_id = 104
    gateway     = "172.20.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 108
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  nocc_node2  = {
    name        = "mariabd02"
    ip          = "172.20.0.105"
    gateway     = "172.20.0.1"
    server_id   = 1
    gtid_domain_id = 105
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 105
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
  nocc_node3 = {
    name        = "mariadb03"
    ip          = "172.20.0.106"
    gateway     = "172.20.0.1"
    server_id   = 1
    gtid_domain_id = 106
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 106
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel-template"
    bridge      = "vmbr0"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
}


maxscale_servers = {
   maxscale_nocc = {
    name = "maxscale01"
    ip = "172.20.0.107"
    gateway = "172.20.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id = 107
    memory = 4096
    cores = 2
    disk_size= "20G"
    template = "rhel-template"
    bridge = "vmbr0"
    storage = "local-lvm"
    node = "proxmox32"
}
}