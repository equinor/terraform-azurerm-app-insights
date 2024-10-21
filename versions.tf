terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.39.0"
    }

    azapi = {
      source  = "azure/azapi"
      version = ">= 2.0.0"
    }
  }
}
