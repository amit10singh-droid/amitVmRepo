data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.venet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "kirti" {
  for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault" "kv" {
  for_each = var.keyvalut
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.keyvalut
  name         = "vm-admin-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.keyvalut
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}


resource "azurerm_network_interface" "nic_card" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.pip_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.address_allocation
    public_ip_address_id =  data.azurerm_public_ip.kirti[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "virtualmachine" {
 for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size  
  admin_username      = data.azurerm_key_vault_secret.username[each.value.key_vault_key].value
  admin_password = data.azurerm_key_vault_secret.password[each.value.key_vault_key].value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic_card[each.key].id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}