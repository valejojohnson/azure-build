output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "resource_group_location" {
  value = azurerm_resource_group.main.location
}

output "vm_ip" {
  value = azurerm_linux_virtual_machine.linux.public_ip_address
}