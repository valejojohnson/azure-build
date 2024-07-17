# Create a Resource group for all of the resources to live in
resource "azurerm_resource_group" "main" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

# Creating a default Network interface then a subnet
resource "azurerm_virtual_network" "default" {
  depends_on = [azurerm_resource_group.main]

  resource_group_name = azurerm_resource_group.main.name
  name                = "${azurerm_resource_group.main.name}-vnet"

  address_space = ["10.0.0.0/16"]
  location       = var.resource_group_location
}

resource "azurerm_subnet" "default" {
  depends_on = [azurerm_virtual_network.default]

  address_prefixes     = ["10.0.1.0/24"]
  name                 = "${azurerm_resource_group.main.name}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.default.name
}
