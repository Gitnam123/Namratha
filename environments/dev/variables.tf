variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type        = list(string)
}

variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    name           = string
    address_prefix = string
  }))
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "security_rules" {
  description = "Network Security Group rules"

  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine size"
  type        = string
}

variable "admin_username" {
  description = "Linux administrator username"
  type        = string
}

variable "admin_password" {
  description = "Linux administrator password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}