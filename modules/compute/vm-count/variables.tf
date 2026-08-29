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

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "vm-devops"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2ats_v2"
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