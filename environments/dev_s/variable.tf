# variable "environment_type" {
#     type = string
# }



variable "control_nodes" {
  type = map(any)
  
}

# variable "worker_nodes" {
#   type = map(any)
  
# }

variable "bastion_nodes" {
  type = map(any)

}


variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type = string
}

<<<<<<<< HEAD:environments/dev_s/variable.tf
========

variable "galera_cluster_nocc" {
  type = map(any)
  
}

variable "maxscale_servers" {
  type = map(any)
  
}

>>>>>>>> dev_m:environments/dev_m/variable.tf
variable "haproxy_nodes" {
  type = map(any)

}

variable "hauler_vm" {
  type = map(any)

}
<<<<<<<< HEAD:environments/dev_s/variable.tf

variable "galera_cluster_nocc" {
  type = map(any)
  
}
========
>>>>>>>> dev_m:environments/dev_m/variable.tf
