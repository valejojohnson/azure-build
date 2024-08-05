terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}
