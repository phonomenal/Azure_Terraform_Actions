resource "azurerm_resource_group" "main" {
  name     = "Octodemo-rg"
  location = "East US"
  tags     = local.tags
}
