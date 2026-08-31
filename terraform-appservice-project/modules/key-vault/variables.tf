variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}
variable "application_insights_instrumentation_key" {
  description = "Application Insights instrumentation key to store in Key Vault"
  type        = string
  sensitive   = true
}
variable "terraform_principal_id" {
  description = "Principal ID used by Terraform to manage Key Vault secrets"
  type        = string
}