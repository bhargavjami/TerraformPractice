resource "azurerm_service_plan" "main" {
  name                = "bhargav-day3-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "main" {
  name                = "bhargav-day3-app-2026"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    app_command_line = "gunicorn --bind=0.0.0.0:8000 app:app"

    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = var.application_insights_connection_string
    "SCM_DO_BUILD_DURING_DEPLOYMENT"        = "true"
  }
}