variable "server_name" {
  description = "Azure SQL logical server name"
  type        = string
}

variable "database_name" {
  description = "Azure SQL database name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "administrator_login" {
  description = "SQL administrator login"
  type        = string
  sensitive   = true
}

variable "administrator_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}

variable "private_endpoint_subnet_id" {
  description = "Subnet ID for the SQL private endpoint"
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID"
  type        = string
}