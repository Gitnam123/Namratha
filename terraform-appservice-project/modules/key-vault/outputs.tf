output "key_vault_id" {
  description = "Key Vault resource ID"
  value       = azurerm_key_vault.this.id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.this.name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.this.vault_uri
}
output "application_insights_instrumentation_key_secret_id" {
  description = "Key Vault secret ID for the Application Insights instrumentation key"
  value       = azurerm_key_vault_secret.application_insights_instrumentation_key.id
}
output "application_insights_instrumentation_key_secret_uri" {
  description = "Key Vault URI of the Application Insights instrumentation key secret"
  value       = azurerm_key_vault_secret.application_insights_instrumentation_key.versionless_id
}