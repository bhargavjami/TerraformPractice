resource "azurerm_key_vault" "main" {
  name                = "bhargav-day3-kv-2026"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id            = var.tenant_id
  sku_name             = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  public_network_access_enabled = true
}

resource "azurerm_key_vault_access_policy" "app" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.tenant_id
  object_id    = var.app_principal_id

  secret_permissions = [
    "Get"
  ]
}

resource "azurerm_private_endpoint" "key_vault" {
  name                = "bhargav-day3-kv-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "key-vault-connection"
    private_connection_resource_id = azurerm_key_vault.main.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}