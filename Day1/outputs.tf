output "resource_group_name" {
  description = "The name of the Azure resource group"
  value       = azurerm_resource_group.example.name
}

output "virtual_network_name" {
  description = "The name of the Azure virtual network"
  value       = azurerm_virtual_network.example.name
}

output "subnet_name" {
  description = "The name of the Azure subnet"
  value       = azurerm_subnet.example.name
}

output "network_interface_name" {
  description = "The name of the network interface"
  value       = azurerm_network_interface.example.name
}