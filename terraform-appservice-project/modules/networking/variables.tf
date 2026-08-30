variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "app_service_subnet_name" {
  description = "Name of the App Service subnet"
  type        = string
}

variable "app_service_subnet_address_prefixes" {
  description = "Address prefixes for App Service subnet"
  type        = list(string)
}

variable "private_endpoint_subnet_name" {
  description = "Name of the Private Endpoint subnet"
  type        = string
}

variable "private_endpoint_subnet_address_prefixes" {
  description = "Address prefixes for Private Endpoint subnet"
  type        = list(string)
}