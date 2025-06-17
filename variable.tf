# variable "environment_type" {
#     type = string
# }



variable "control_nodes" {
  type = map(any)
  
}

# variable "worker_nodes" {
#   type = map(any)
  
# }

# variable "bastion_nodes" {
#   type = map(any)

# }


variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type = string
}