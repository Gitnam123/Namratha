output "id" {
  description = "Public IP resource ID"
  value       = azurerm_public_ip.this.id
}

output "ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.this.ip_address
}

output "name" {
  description = "Public IP name"
  value       = azurerm_public_ip.this.name
}