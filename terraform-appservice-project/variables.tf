variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "app_service_subnet_name" {
  type = string
}

variable "app_service_subnet_address_prefixes" {
  type = list(string)
}

variable "private_endpoint_subnet_name" {
  type = string
}

variable "private_endpoint_subnet_address_prefixes" {
  type = list(string)
}
variable "app_service_plan_name" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "app_service_sku" {
  type    = string
  default = "B1"
}
variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
}
variable "private_endpoint_name" {
  type = string
}

variable "private_dns_zone_name" {
  type = string
}

variable "sql_server_name" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "sql_database_sku_name" {
  type = string
}

variable "sql_admin_login_name" {
  type = string
}

variable "sql_admin_object_id" {
  type = string
}

variable "sql_admin_tenant_id" {
  type = string
}

variable "application_insights_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}