data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source = "./modules/networking/vnet"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

module "subnet" {
  source = "./modules/networking/subnet"

  resource_group_name  = azurerm_resource_group.main.name
  vnet_name            = module.vnet.vnet_name
}

module "key_vault" {
  source = "./modules/key_vault"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  app_principal_id    = module.app_service.app_principal_id
  subnet_id           = module.subnet.subnet_id
}

module "sql_server" {
  source = "./modules/sql/server"

  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  object_id            = data.azurerm_client_config.current.object_id
  tenant_id            = data.azurerm_client_config.current.tenant_id
}

module "sql_database" {
  source = "./modules/sql/database"

  server_id = module.sql_server.server_id
}

module "app_service" {
  source = "./modules/app_service"

  resource_group_name                    = azurerm_resource_group.main.name
  location                               = azurerm_resource_group.main.location
  application_insights_connection_string = module.monitoring.application_insights_connection_string
}

module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}