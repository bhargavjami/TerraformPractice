variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "bhargav-day3-rg"
}