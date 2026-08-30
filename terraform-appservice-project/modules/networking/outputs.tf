output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "resource_group_id" {
  value = azurerm_resource_group.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "app_service_subnet_id" {
  value = azurerm_subnet.app_service.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}