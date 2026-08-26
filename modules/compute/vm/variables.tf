variable "name" {
  description = "Virtual Machine name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
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

variable "network_interface_ids" {
  description = "Network Interface IDs"
  type        = list(string)
}

variable "os_disk_type" {
  description = "OS disk storage type"
  type        = string
  default     = "Standard_LRS"
}

variable "image" {
  description = "Linux VM image"

  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
variable "admin_password" {
  description = "Linux administrator password"
  type        = string
  sensitive   = true
}