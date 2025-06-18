# variable "environment_type" {
#     type = string
# }



variable "galera_cluster_nocc" {
  type = map(any)
  
}

variable "maxscale_servers" {
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