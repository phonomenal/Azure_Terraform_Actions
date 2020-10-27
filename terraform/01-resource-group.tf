resource "azurerm_resource_group" "main" {
  name     = "${var.requesting_team}-rg"
  location = var.location
  tags     = local.tags
}

# resource "azurerm_role_assignment" "main" {
#   scope                = azurerm_resource_group.main.id
#   role_definition_name = "Contributor"
#   principal_id         = var.object_id
# }

resource "azurerm_policy_assignment" "Diagnostic_Logs" {
  name                 = "Diagnostic_Logs"
  scope                = azurerm_resource_group.main.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b607c5de-e7d9-4eee-9e5c-83f1bcee4fa0"

}

resource "azurerm_policy_assignment" "HTTP_Version_Latest" {
  name                 = "HTTP_Version_Latest"
  scope                = azurerm_resource_group.main.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8c122334-9d20-4eb8-89ea-ac9a705b74ae"

}

resource "azurerm_policy_assignment" "TLS_Version_Latest" {
  name                 = "TLS_Version_Latest"
  scope                = azurerm_resource_group.main.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b"

}
