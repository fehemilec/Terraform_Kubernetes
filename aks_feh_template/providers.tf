terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

   backend "azurerm" {
    # resource_group_name  = "ce-shared"
    # storage_account_name = "satfstatesfehemi"
    # container_name       = "platform" #use variable not possible
    # key                  = "platform.tfstate"
  }
}

provider "azurerm" {
  features {}
}