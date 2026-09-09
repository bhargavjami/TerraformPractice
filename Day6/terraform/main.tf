module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source = "./modules/networking"

  name                = "day6-vnet"
  location            = var.location
  resource_group_name = module.resource_group.name

  address_space = ["10.10.0.0/16"]

  aks_subnet_address_prefix              = "10.10.1.0/24"
  app_gateway_subnet_address_prefix      = "10.10.2.0/24"
  private_endpoint_subnet_address_prefix = "10.10.3.0/24"
}

module "acr" {
  source = "./modules/acr"

  name                = "day6acr2026bhargav"
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "aks" {
  source = "./modules/aks"

  name                = "day6-aks"
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = "day6aks"

  subnet_id = module.networking.aks_subnet_id
  acr_id    = module.acr.id
}

module "sql" {
  source = "./modules/sql"

  server_name         = "day6-sql-2026-bhargav"
  database_name       = "day6-db"
  location            = var.location
  resource_group_name = module.resource_group.name

  administrator_login    = var.sql_admin_username
  administrator_password = var.sql_admin_password

  private_endpoint_subnet_id = module.networking.private_endpoint_subnet_id
  vnet_id                    = module.networking.vnet_id
}

module "application_gateway" {
  source = "./modules/application_gateway"

  name                = "day6-appgw"
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.networking.app_gateway_subnet_id

  backend_ip = "4.249.60.108"
}