variable "name" {
  description = "Application Gateway name"
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

variable "subnet_id" {
  description = "Application Gateway subnet ID"
  type        = string
}

variable "backend_ip" {
  description = "Public IP address of the Kubernetes LoadBalancer service"
  type        = string
}