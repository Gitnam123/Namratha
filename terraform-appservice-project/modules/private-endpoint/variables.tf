variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "private_endpoint_name" {
  description = "Private Endpoint name"
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "Subnet ID for the Private Endpoint"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault resource ID"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS zone for Azure Key Vault"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network resource ID"
  type        = string
}