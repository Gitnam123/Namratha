terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstatepgsn"
    container_name       = "tfstate"
    key                  = "appservice-project.tfstate"
  }
}