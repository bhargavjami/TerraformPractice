resource "azurerm_mssql_server" "main" {
  name                          = "bhargav-day3-sql-2026"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true

  azuread_administrator {
    login_username              = "github-actions-terraform"
    object_id                   = var.object_id
    tenant_id                   = var.tenant_id
    azuread_authentication_only = true
  }

  lifecycle {
    ignore_changes = [
      azuread_administrator
    ]
  }
}