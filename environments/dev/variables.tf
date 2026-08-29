# ============================================================
# RESOURCE GROUP
# ============================================================

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}


# ============================================================
# AZURE LOCATION
# ============================================================

variable "location" {
  description = "Azure region"
  type        = string
}


# ============================================================
# VIRTUAL NETWORK
# ============================================================

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type        = list(string)
}


# ============================================================
# SUBNET
# ============================================================

variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    name           = string
    address_prefix = string
  }))
}


# ============================================================
# NETWORK SECURITY GROUP
# ============================================================

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


# ============================================================
# PUBLIC IP
# ============================================================

variable "public_ip_name" {
  description = "Base Public IP name"
  type        = string
}


# ============================================================
# NETWORK INTERFACE
# ============================================================

variable "nic_name" {
  description = "Base Network Interface name"
  type        = string
}


# ============================================================
# VIRTUAL MACHINE
# ============================================================

variable "vm_name" {
  description = "Base Virtual Machine name"
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


# ============================================================
# COUNT
# ============================================================

variable "vm_count" {
  description = "Number of VMs to create using count"
  type        = number
  default     = 2
}


# ============================================================
# FOR_EACH
# ============================================================

variable "vm_foreach" {
  description = "Configuration for VMs to create using for_each"

  type = map(object({
    size = string
  }))
}


# ============================================================
# TAGS
# ============================================================

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}