output "sql_server_name" {
  value = azurerm_mssql_server.main.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.main.name
}

output "app_name" {
  value = azurerm_linux_web_app.main.name
}

output "app_principal_id" {
  value = azurerm_linux_web_app.main.identity[0].principal_id
}