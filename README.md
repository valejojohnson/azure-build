# Azure Terraform Build - US WEST 2 (Default)
## My first terraform build for azure resources

### Mostly following this guide for starting this process
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-cli

- [x] providers.tf
  - [x] azurerm provider
  - [x] random-name generator
- [x] main.tf
  - [x] Resource Group
  - [x] VNET
  - [x] Subnet
  - [x] SSH Key
  - [x] Network Interface
  - [x] Public IP
- [x] vars.tf
  - [x] resource group location
  - [x] name prefix
  - [x] default username
- [ ] vm.tf
  - [ ] VM
