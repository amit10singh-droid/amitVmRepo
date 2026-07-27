rgs = {
  rg1 = {
    name     = "dev-rg"
    location = "eastus"
  }  
}

vnet = {
  vent1 = {
    name = "dev-vnet"
    resource_group_name  = "dev-rg"
    location             = "uaenorth"
    address_space        = ["10.0.0.0/16"]
  }
  vent2 = {
    name = "prod-vnet"
    resource_group_name  = "dev-rg"
    location             = "centralindia"
    address_space        = ["20.0.0.0/16"]
  }
}
subnets = {
  sn1 = {
    name                 = "dev-subnet"
    virtual_network_name = "dev-vnet"
    resource_group_name  = "dev-rg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  Sn2 = {
    name                 = "dev-subnet"
    virtual_network_name = "dev-vnet"
    resource_group_name  = "dev-rg"
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

    resource_group_name  = "dev-rg"
    name                = "dev-ip"
    resource_group_name = "dev-rg"
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
    # admin_username      = "test123"
    # admin_password      = "Password@123"
    key_vault_key            = "kv1"
    nic_name            = "dev-nic"
    pip_name            = "dev-ip"
    address_allocation  = "Dynamic"
    subnet_name         = "dev-subnet"
    venet_name          = "dev-vnet"
  }

  vm2 = {
    vm_name             = "dev-vm"
    resource_group_name = "dev-rg"
    location            = "centralindia"
    size                = "Standard_D2s_v3"
    # admin_username      = "test123"
    # admin_password      = "Password@123"   
    key_vault_key           = "kv1"  
    nic_name            = "dev-nic"
    pip_name            = "dev-ip"
    address_allocation  = "Dynamic"
    subnet_name         = "dev-subnet"
    venet_name          = "dev-vnet"
    
  }
}


keyvalut = {
  kv1 = {
    name                       = "amal-kv"
    location                   = "centralindia"
    resource_group_name        = "prod-rg"
    # tenant_id                  = "b4e113af-6735-4b69-af7d-2bc29e2c915f"
    sku_name                   = "standard"
    purge_protection_enabled   = false
    soft_delete_retention_days = 7

    enable_rbac_authorization = true
    # value                     = "test123"
    # password                  = "Password@123"
    admin_username = "test123"

  }
}
