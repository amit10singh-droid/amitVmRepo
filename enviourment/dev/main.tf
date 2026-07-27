module "resource_group" {
  source = "../../modules/azurerm_ResourceGroup"
  resource_group   = var.rgs
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_vnet"
  vnets     = var.vnet
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnets     = var.subnets
}

module "publicip" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_publicids"
  public_ips = var.pip
}
module "virtual_machine" { 
 source = "../../modules/azurem_vm"
depends_on = [module.resource_group, module.publicip]
 vms = var.vms
 keyvalut = var.keyvalut 
}
