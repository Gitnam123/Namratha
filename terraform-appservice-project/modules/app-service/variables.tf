variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
}

variable "app_service_subnet_id" {
  description = "Subnet ID used for App Service VNet Integration"
  type        = string
}

variable "sku_name" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "dotnet_version" {
  description = "Application stack version"
  type        = string
  default     = "8.0"
}
variable "application_insights_instrumentation_key" {
  description = "Application Insights instrumentation key"
  type        = string
  sensitive   = true
}
variable "sql_server" {
  description = "Azure SQL Server fully qualified domain name"
  type        = string
}

variable "sql_database" {
  description = "Azure SQL Database name"
  type        = string
}