terraform {

  backend "azurerm" {

    resource_group_name  = "tfstate-rg"

    storage_account_name = "geniotfstate"

    container_name       = "terraform-state"

    key                  = "prod.tfstate"
  }
}
