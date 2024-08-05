# Terraform Configuration for Azure Infrastructure

This Terraform configuration creates various Azure resources including a resource group, virtual network, subnet, public IP, network interface, SSH key, and network security group. It also pulls the local IP address from a script and uses it for security group configuration.


## Quick Start

Follow these steps to quickly set up the Azure infrastructure using this Terraform configuration:

1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd <repository-directory> 
   chmod +x local_ip.sh
   ```
2. **Initialize Terraform and Deploy:**
   ```sh
   terraform init
   terraform apply --auto-approve
   ```



## Resources Created

### Local IP Address
- **Data Source:** `data "external" "ip_address"`
  - Pulls the local IP address using a script named `local_ip.sh`.

### Resource Group
- **Resource:** `azurerm_resource_group.main`
  - Creates a resource group where all other resources will reside.
  - Depends on the local IP address data source.

### Virtual Network
- **Resource:** `azurerm_virtual_network.default`
  - Creates a virtual network.
  - Depends on the resource group.

### Subnet
- **Resource:** `azurerm_subnet.default`
  - Creates a subnet within the virtual network.
  - Depends on the virtual network.

### SSH Public Key
- **Resource:** `azurerm_ssh_public_key.default`
  - Stores an SSH public key.
  - Depends on the resource group.

### Public IP Address
- **Resource:** `azurerm_public_ip.ipv4`
  - Creates a public IP address for VMs.
  - Depends on the resource group.

### Network Interface
- **Resource:** `azurerm_network_interface.default`
  - Creates a network interface for VMs.
  - Depends on the subnet.
  - Configures a public IP address and a dynamic private IP address.

### Network Security Group
- **Resource:** `azurerm_network_security_group.port22`
  - Defines a network security group to allow SSH access (port 22).
  - Depends on the network interface.
  - Uses the local IP address from the data source for source address prefix.

### Network Interface Security Group Association
- **Resource:** `azurerm_network_interface_security_group_association.port22`
  - Associates the network security group with the network interface.

## How to Use

1. Ensure the `local_ip.sh` script is present in the same directory as the `main.tf` file.
2. Make the `local_ip.sh` script executable:
   ```sh
   chmod +x local_ip.sh
   ```
## Requirements

	•	Terraform
	•	Azure CLI & Azure Subscription (Logged into Azure Account within Terminal)
	•	An SSH public key available at ~/.ssh/id_rsa.pub

## Variables

	•	var.tf: The Azure location where resources will be created (e.g., East US).