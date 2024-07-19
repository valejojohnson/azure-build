output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "resource_group_location" {
  value = azurerm_resource_group.main.location
}

output "vm" {
  value = azurerm_linux_virtual_machine.linux.public_ip_address
}

output "vm_ami" {
  value = azurerm_linux_virtual_machine.linux.source_image_id
}