variable "name" {
  description = "Network Interface name"
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

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP ID"
  type        = string
}

variable "network_security_group_id" {
  description = "Network Security Group ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}