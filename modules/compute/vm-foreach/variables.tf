variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where NICs will be created"
  type        = string
}

variable "vm_config" {
  description = "Configuration for each VM"

  type = map(object({
    size = string
  }))
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "vm-devops"
}

variable "image_publisher" {
  type    = string
  default = "Canonical"
}

variable "image_offer" {
  type    = string
  default = "ubuntu-24_04-lts"
}

variable "image_sku" {
  type    = string
  default = "server"
}

variable "image_version" {
  type    = string
  default = "latest"
}
variable "network_security_group_id" {
  description = "Network Security Group ID for VM NICs"
  type        = string
}