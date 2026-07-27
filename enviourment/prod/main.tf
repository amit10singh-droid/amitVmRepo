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
 depends_on = [ module.resource_group, azurerm_public_ip ]
 source = "../../modules/azurem_vm"
 vms = var.vms
}
