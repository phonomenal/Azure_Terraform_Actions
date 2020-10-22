resource "azurerm_app_service_plan" "main" {
  name                = "${local.service_name}-appservice"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "phonomenal-app-service"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
