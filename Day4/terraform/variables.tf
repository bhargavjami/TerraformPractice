variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "day4-cloud-devops-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
  default     = "day4-app-service-plan"
}

variable "ui_app_name" {
  description = "UI Web App name"
  type        = string
}

variable "api_app_name" {
  description = "API Web App name"
  type        = string
}