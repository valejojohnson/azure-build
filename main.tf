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
  location      = var.resource_group_location
}

# Default Subnet
resource "azurerm_subnet" "default" {
  depends_on = [azurerm_virtual_network.default]

  address_prefixes     = ["10.0.1.0/24"]
  name                 = "${azurerm_resource_group.main.name}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.default.name
}

# SSH Key
resource "azurerm_ssh_public_key" "default" {
  depends_on = [azurerm_resource_group.main]

  location            = var.resource_group_location
  name                = "${azurerm_resource_group.main.name}-ssh-key"
  public_key          = file("~/.ssh/id_rsa.pub")
  resource_group_name = azurerm_resource_group.main.name
}

# Public IP for VM's
resource "azurerm_public_ip" "default" {
  depends_on = [azurerm_resource_group.main]

  allocation_method   = "Dynamic"
  location            = var.resource_group_location
  name                = "${azurerm_resource_group.main.name}-public-ip"
  resource_group_name = azurerm_resource_group.main.name
}

# Network interface for VM's
resource "azurerm_network_interface" "default" {
  depends_on = [azurerm_subnet.default]

  location            = var.resource_group_location
  name                = "${azurerm_resource_group.main.name}-netinf"
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "default-ip-config"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.default.id
  }
}


# Define Network Security Group
resource "azurerm_network_security_group" "port22" {
  name                = "${azurerm_resource_group.main.name}-allow_port22"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "port22" {
  network_interface_id      = azurerm_network_interface.default.id
  network_security_group_id = azurerm_network_security_group.port22.id
}