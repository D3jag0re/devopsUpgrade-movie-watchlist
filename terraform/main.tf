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
  custom_dns           = false
  depends_on           = [module.resource_group]
}

module "subnet" {
  source                 = "github.com/D3jag0re/tf-modules-azure//subnet"
  subnet_name            = "subnetA"
  subnet_addressprefixes = local.subnet_A_addressprefixes
  rg_name                = module.resource_group.rg_name
  vnet_name              = module.virtual_network.vnet_name
  depends_on             = [module.virtual_network]
}

module "virtual_machine_A" {
  source     = "github.com/D3jag0re/tf-modules-azure//virtualMachineLinux"
  vm_name    = "vm-linux-A"
  rg_name    = module.resource_group.rg_name
  nic_subnet = module.subnet.subnet_id
  depends_on = [module.subnet]
}
