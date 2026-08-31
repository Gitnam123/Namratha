variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sql_server_name" {
  description = "Globally unique Azure SQL logical server name"
  type        = string
}

variable "sql_database_name" {
  description = "Azure SQL database name"
  type        = string
}

variable "sql_database_sku_name" {
  description = "Azure SQL Database SKU"
  type        = string
}

variable "app_service_principal_id" {
  description = "App Service Managed Identity principal ID"
  type        = string
}
variable "app_service_identity_name" {
  description = "Name of the App Service Managed Identity"
  type        = string
}
variable "sql_admin_tenant_id" {
  description = "Microsoft Entra tenant ID"
  type        = string
}