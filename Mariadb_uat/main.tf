terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc9"
    }
  }
}
provider "proxmox" {                                     # access
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
pm_api_token_secret  = "REDACTED_USE_ENV"
  pm_tls_insecure     = true
  pm_debug = true
}

module "galera_cluster_nocc" {
  source = "./modules/vm"
  for_each = var.galera_cluster_nocc
  vm_config = each.value
}

module "maxscale_servers" {
  source = "./modules/vm"
  for_each = var.maxscale_servers
  vm_config = each.value
}


