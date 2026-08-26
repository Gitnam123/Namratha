output "id" {
  description = "Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "Virtual Machine name"
  value       = azurerm_linux_virtual_machine.this.name
}