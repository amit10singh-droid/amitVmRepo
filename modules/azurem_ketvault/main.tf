
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "vault" {
for_each = var.keyvalut
  name                        =each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard" # Options: standard or premium

  # Grant your logged-in user account permissions to manage the vault
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Create", "Delete", "List"
    ]

    secret_permissions = [
      "Get", "Set", "Delete", "List", "Purge"
    ]

    storage_permissions = [
      "Get"
    ]
  }
}

# 5. Optional: Add a Secret inside the Vault
resource "azurerm_key_vault_secret" "db_password" {
  name         = "database-password"
  value        = "SuperSecretPassword123!"
  key_vault_id = azurerm_key_vault.vault.id
}

# 6. Outputs to track the resources
output "key_vault_uri" {
  value       = azurerm_key_vault.vault.vault_uri
  description = "The URI of the Key Vault for performing operations."
}
