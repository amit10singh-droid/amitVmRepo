terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # Recommended to pin to a major version
    }
  }
}

# 2. Configure the provider
provider "azurerm" {
  # The features block is required for the azurerm provider
  features {}
}