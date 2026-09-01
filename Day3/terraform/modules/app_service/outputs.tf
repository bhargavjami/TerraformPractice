output "service_plan_id" {
  value = azurerm_service_plan.main.id
}

output "app_principal_id" {
  value = azurerm_linux_web_app.main.identity[0].principal_id
}

output "app_name" {
  value = azurerm_linux_web_app.main.name
}