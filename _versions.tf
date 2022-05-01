terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.4.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">=0.1.1"
    }
    random = {
      source  = "random"
      version = ">=3.1.3"
    }
  }
}