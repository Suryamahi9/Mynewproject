provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "myrg1"
  location = "East US"
}

resource "azurerm_storage_account" "sg1" {
  name                     = "storage1454h"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sgc1" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sg1.name
  container_access_type = "private"
}
