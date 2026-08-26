output "id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.this.name
}