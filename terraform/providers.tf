terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatecacestorage"
    container_name       = "tfstate"
    key                  = "movie.terraform.tfstate"
  }
}


provider "azurerm" {
  #skip_provider_registration = true
  use_oidc = true
  features {}
}

data "azurerm_client_config" "current" {}