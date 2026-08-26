output "id" {
  description = "Network Interface ID"
  value       = azurerm_network_interface.this.id
}

output "name" {
  description = "Network Interface name"
  value       = azurerm_network_interface.this.name
}