resource "azurerm_mssql_database" "main" {
  name      = "student-registration-db"
  server_id = var.server_id
  sku_name  = "Basic"
}