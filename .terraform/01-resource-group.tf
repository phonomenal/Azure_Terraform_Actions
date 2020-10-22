resource "azurerm_resource_group" "main" {
  name     = "${local.service_name}-rg"
  location = "East US"
  tags     = "${local.tags}"
}
