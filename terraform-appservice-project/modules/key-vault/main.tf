resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id

  sku_name = "standard"

  rbac_authorization_enabled    = true
  public_network_access_enabled = false
  purge_protection_enabled      = false
}

resource "azurerm_role_assignment" "terraform_key_vault_secrets_officer" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = var.terraform_principal_id
}

resource "azurerm_key_vault_secret" "application_insights_instrumentation_key" {
  name         = "APPINSIGHTS-INSTRUMENTATION-KEY"
  value        = var.application_insights_instrumentation_key
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_role_assignment.terraform_key_vault_secrets_officer
  ]
}