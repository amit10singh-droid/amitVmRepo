rgs = {
  rg1 = {
    name     = "prod-rg"
    location = "eastus"
  }  
}

vnet = {
  vent1 = {
    name = "prod-vnet"
    resource_group_name  = "prod-rg"
    location             = "uaenorth"
    address_space        = ["10.0.0.0/16"]
  }
  vent2 = {
    name = "prod-vnet"
    resource_group_name  = "prod-rg"
    location             = "centralindia"
    address_space        = ["20.0.0.0/16"]
  }
}
subnets = {
  sn1 = {
    name                 = "prod-subnet"
    virtual_network_name = "prod-vnet"
    resource_group_name  = "prod-rg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  Sn2 = {
    name                 = "prod-subnet"
    virtual_network_name = "prod-vnet"
    resource_group_name  = "prod-rg"
    address_prefixes     = ["20.0.1.0/24"]
  }
}


pip = {
  pip1 = {
    name                = "dev-ip"
    resource_group_name = "dev-rg"
    location            = "uaenorth"
    allocation_method   = "Static"
  }
  pip2 = {

    name                = "prod-ip"
    resource_group_name = "prod-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}


vms = {
  vm1 = {
    vm_name             = "dev-vm"
    resource_group_name = "dev-rg"
    location            = "uaenorth"
    size                = "Standard_D2s_v3"
    admin_username      = "test123"
    admin_password      = "Password@123"
    nic_name            = "dev-nic"
    pip_name            = "dev-ip"
    address_allocation  = "Dynamic"
    subnet_name         = "dev-subnet"
    venet_name          = "dev-vnet"
  }

  vm2 = {
    vm_name             = "prod-vm"
    resource_group_name = "prod-rg"
    location            = "centralindia"
    size                = "Standard_D2s_v3"
    admin_username      = "test123"
    admin_password      = "Password@123"
    nic_name            = "prod-nic"
    pip_name            = "prod-ip"
    address_allocation  = "Dynamic"
    subnet_name         = "prod-subnet"
    venet_name          = "prod-vnet"
  }
}

