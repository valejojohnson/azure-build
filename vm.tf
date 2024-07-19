resource "azurerm_linux_virtual_machine" "linux" {
  depends_on = [azurerm_ssh_public_key.default]
  admin_username        = var.default_username
  location              = var.resource_group_location
  name                  = "linuxvm"
  network_interface_ids = [azurerm_network_interface.default.id]
  resource_group_name   = azurerm_resource_group.main.name
  size                  = "Standard_B1s"

  admin_ssh_key {
    public_key = azurerm_ssh_public_key.default.public_key
    username   = var.default_username
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}