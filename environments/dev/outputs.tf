output "resource_group_name" {
  description = "Resource Group name"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "Resource Group ID"
  value       = module.resource_group.id
}

output "resource_group_location" {
  description = "Resource Group location"
  value       = module.resource_group.location
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = module.vnet.name
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.vnet.id
}

output "subnet_ids" {
  description = "Subnet IDs"

  value = {
    for name, subnet in module.subnet :
    name => subnet.id
  }
}

output "nsg_name" {
  description = "Network Security Group name"
  value       = module.nsg.name
}

output "public_ip_address" {
  description = "Public IP address"
  value       = module.public_ip.ip_address
}

output "nic_name" {
  description = "Network Interface name"
  value       = module.nic.name
}

output "vm_name" {
  description = "Virtual Machine name"
  value       = module.vm.name
}

output "vm_id" {
  description = "Virtual Machine ID"
  value       = module.vm.id
}