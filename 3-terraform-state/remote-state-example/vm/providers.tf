terraform {
  backend "azurerm" {
    resource_group_name  = "deploy-first-rg"
    storage_account_name = "deployfirstlabopssa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

}

provider "azurerm" {
  features {}
}
