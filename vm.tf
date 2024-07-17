# resource "azurerm_linux_virtual_machine" "linux" {
#   admin_username      = var.defaultun
#   location            = var.resource_group_location
#   name                = "first_linux_vm"
#   network_interface_ids = [azurerm_network_interface.default.id]
#   resource_group_name = azurerm_resource_group.main.name
#   size                = "B1s"
#
#   admin_ssh_key {
#     public_key = azurerm_ssh_public_key.default.public_key
#     username   = var.defaultun
#   }
#
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#
#   source_image_id = ""
# }