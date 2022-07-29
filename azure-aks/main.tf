terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  region = "West US"
}

module "azurerm_resource_group" "azucar1" {
  region = "West US"
  description = "Resources stored in this area"
  resource_group_name = "azucar-1"
}

module "bridgecrew-read" {
  source                     = "bridgecrewio/bridgecrew-azure-read-only/azurerm"
  org_name                   = "rodriguezsr4"
  bridgecrew_token           = "41df9361-9efc-4ccd-a7c0-09f06ad21cf4"
}