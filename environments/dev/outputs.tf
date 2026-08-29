output "count_vm_ids" {
  description = "VM IDs created using count"
  value       = module.vm_count.vm_ids
}

output "count_vm_names" {
  description = "VM names created using count"
  value       = module.vm_count.vm_names
}

output "count_private_ip_addresses" {
  description = "Private IP addresses created using count"
  value       = module.vm_count.private_ip_addresses
}

output "count_public_ip_addresses" {
  description = "Public IP addresses created using count"
  value       = module.vm_count.public_ip_addresses
}

output "foreach_vm_ids" {
  description = "VM IDs created using for_each"
  value       = module.vm_foreach.vm_ids
}

output "foreach_vm_names" {
  description = "VM names created using for_each"
  value       = module.vm_foreach.vm_names
}

output "foreach_private_ip_addresses" {
  description = "Private IP addresses created using for_each"
  value       = module.vm_foreach.private_ip_addresses
}

output "foreach_public_ip_addresses" {
  description = "Public IP addresses created using for_each"
  value       = module.vm_foreach.public_ip_addresses
}