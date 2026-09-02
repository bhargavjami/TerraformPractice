module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "app_service_plan" {
  source = "./modules/app_service_plan"

  name                = var.app_service_plan_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "ui_app" {
  source = "./modules/ui_app"

  name                = var.ui_app_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  service_plan_id     = module.app_service_plan.id
}

module "api_app" {
  source = "./modules/api_app"

  name                = var.api_app_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  service_plan_id     = module.app_service_plan.id
}