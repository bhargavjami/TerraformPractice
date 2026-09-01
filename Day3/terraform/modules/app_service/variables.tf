variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "application_insights_connection_string" {
  type      = string
  sensitive = true
}