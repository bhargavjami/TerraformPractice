variable "name" {
  description = "AKS cluster name"
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

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "subnet_id" {
  description = "AKS subnet ID"
  type        = string
}

variable "acr_id" {
  description = "ACR resource ID"
  type        = string
}