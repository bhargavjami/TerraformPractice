terraform {
  backend "azurerm" {
    resource_group_name  = "bhargav-day3-rg"
    storage_account_name = "bhargavday3tfstate2026"
    container_name       = "tfstate"
    key                  = "day3.tfstate"
  }
}