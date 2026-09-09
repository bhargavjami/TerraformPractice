variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West US 3"
}

variable "resource_group_name" {
  description = "Day 6 resource group name"
  type        = string
  default     = "day6-cloud-devops-rg"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "day6"
}

variable "sql_admin_username" {
  description = "Azure SQL administrator username"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "Azure SQL administrator password"
  type        = string
  sensitive   = true
}