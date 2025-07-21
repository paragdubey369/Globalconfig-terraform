
output "control_nodes" {
  value = {
    for node in var.control_nodes :
    node.name => node.ip
  }
}

output "worker_nodes" {
  value = {
    for node in var.worker_nodes :
    node.name => node.ip
  }
}

output "bastion_nodes" {
  value = {
    for node in var.bastion_nodes :
    node.name => node.ip
  }
}


output "galera_cluster_nocc"  {
  value = {
    for node in var.galera_cluster_nocc :
    node.name => node.ip
  }
}


output "haproxy_nodes" {
  value = {
    for node in var.haproxy_nodes :
    node.name => node.ip
  }
}




