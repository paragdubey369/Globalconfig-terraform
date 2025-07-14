



variable "vm_config" {
  type = object({
    name        = string
    ip          = string
    gateway     = string
    dns_servers = list(string)
    vm_id       = number
    memory      = number
    cores       = number
    disk_size   = string
    template    = string
    bridge      = string
    storage     = string
    node        = string
  })
}
