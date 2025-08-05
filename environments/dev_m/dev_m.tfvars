control_nodes = {
  node1 = {
    name        = "control-1"
    ip          = "172.17.0.200"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 200
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
    ip          = "172.17.0.201"
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

}

bastion_nodes = {
    node1 = {
    name = "bastion-1"
    ip = "172.17.0.210"
    gateway = "172.17.0.1"
    dns_servers = ["1.1.1.1"]
    vm_id = 211
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
    ip          = "172.17.0.204"
    server_id   = 1
    gtid_domain_id = 104
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 204
    memory      = 16384
    cores       = 8
    disk_size   = "60G"
    template    = "rhel"
    bridge      = "vmbr1"
    storage     = "local-lvm"
    node        = "proxmox32"
  }
# nocc_node2  = {
#     name        = "mariabd02"
#     ip          = "172.17.0.205"
#     gateway     = "172.17.0.1"
#     server_id   = 1
#     gtid_domain_id = 105
#     dns_servers = ["1.1.1.1", "8.8.8.8"]
#     vm_id       = 205
#     memory      = 16384
#     cores       = 8
#     disk_size   = "60G"
#     template    = "rhel"
#     bridge      = "vmbr1"
#     storage     = "local-lvm"
#     node        = "proxmox32"
#   }
# nocc_node3 = {
#     name        = "mariadb03"
#     ip          = "172.17.0.206"
#     gateway     = "172.17.0.1"
#     server_id   = 1
#     gtid_domain_id = 106
#     dns_servers = ["1.1.1.1", "8.8.8.8"]
#     vm_id       = 206
#     memory      = 16384
#     cores       = 8
#     disk_size   = "60G"
#     template    = "rhel"
#     bridge      = "vmbr1"
#     storage     = "local-lvm"
#     node        = "proxmox32"
#   }
# }
# maxscale_servers = {
#    maxscale_nocc = {
#     name = "maxscale01"
#     ip = "172.17.0.207"
#     gateway = "172.17.0.1"
#     dns_servers = ["1.1.1.1"]
#     vm_id = 207
#     memory = 4096
#     cores = 2
#     disk_size= "40G"
#     template = "rhel"
#     bridge = "vmbr1"
#     storage = "local-lvm"
#     node = "proxmox32"
# }
}
haproxy_nodes = {
  primary_group = {
    name        = "haproxy1"
    ip          = "172.17.0.209"
    primary_ha =  "haproxy1"
    gateway     = "172.17.0.1"
    dns_servers = ["1.1.1.1", "8.8.8.8"]
    vm_id       = 209
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
