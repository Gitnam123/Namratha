output "vm_ids" {
  description = "IDs of all VMs"
  value       = azurerm_linux_virtual_machine.this[*].id
}

output "vm_names" {
  description = "Names of all VMs"
  value       = azurerm_linux_virtual_machine.this[*].name
}

output "private_ip_addresses" {
  description = "Private IP addresses"
  value       = azurerm_network_interface.this[*].private_ip_address
}

output "public_ip_addresses" {
  description = "Public IP addresses"
  value       = azurerm_public_ip.this[*].ip_address
}