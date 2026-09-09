variable "name" {
  description = "Name of the virtual network"
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

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "aks_subnet_address_prefix" {
  description = "AKS subnet address prefix"
  type        = string
}

variable "app_gateway_subnet_address_prefix" {
  description = "Application Gateway subnet address prefix"
  type        = string
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Private Endpoint subnet address prefix"
  type        = string
}