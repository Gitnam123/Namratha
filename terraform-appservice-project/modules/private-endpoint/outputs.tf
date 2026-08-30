output "private_endpoint_id" {
  description = "Private Endpoint resource ID"
  value       = azurerm_private_endpoint.key_vault.id
}

output "private_endpoint_ip" {
  description = "Private IP address of the Key Vault Private Endpoint"
  value       = azurerm_private_endpoint.key_vault.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  value       = azurerm_private_dns_zone.key_vault.id
}