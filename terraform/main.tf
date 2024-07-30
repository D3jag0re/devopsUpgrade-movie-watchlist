module "resource_group" {
  source      = "github.com/D3jag0re/tf-modules-azure//resourceGroup"
  rg_name     = "movie-RG"
  rg_location = local.location
  tags = {
    createdBy = "me"
    purpose   = "testing"
  }
}

module "virtual_network" {
  source               = "github.com/D3jag0re/tf-modules-azure//virtualNetwork"
  vnet_name            = "movie-vnet"
  vnet_location        = local.location
  rg_name              = module.resource_group.rg_name
  vnet_addressprefixes = local.vnet_addressprefixes
}