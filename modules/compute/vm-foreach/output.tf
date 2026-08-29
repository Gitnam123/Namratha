output "vm_ids" {
  description = "IDs of all VMs"
  value = {
    for key, vm in azurerm_linux_virtual_machine.this :
    key => vm.id
  }
}

output "vm_names" {
  description = "Names of all VMs"
  value = {
    for key, vm in azurerm_linux_virtual_machine.this :
    key => vm.name
  }
}

output "private_ip_addresses" {
  description = "Private IP addresses"
  value = {
    for key, nic in azurerm_network_interface.this :
    key => nic.private_ip_address
  }
}

output "public_ip_addresses" {
  description = "Public IP addresses"
  value = {
    for key, pip in azurerm_public_ip.this :
    key => pip.ip_address
  }
}