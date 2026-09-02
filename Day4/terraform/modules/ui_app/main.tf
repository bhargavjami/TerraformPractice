resource "azurerm_linux_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      python_version = "3.12"
    }

    app_command_line = "python -m http.server 8000 --bind 0.0.0.0"
  }

  app_settings = {
    WEBSITES_PORT = "8000"
  }
}