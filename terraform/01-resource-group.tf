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

resource "azurerm_policy_assignment" "HITRUST_HIPPA" {
  name                 = "HITRUST_HIPAA"
  scope                = azurerm_resource_group.main.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/a169a624-5599-4385-a696-c8d643089fab"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

  parameters = <<PARAMETERS
{
  "Application names (supports wildcards)": 
    {
      "value" :"*" 
    },
  "Storage Account Prefix for Regional Storage Account to deploy diagnostic settings for Network Security Groups": 
    {
      "value" :"*" 
    },
  "Resource Group Name for Storage Account (must exist) to deploy diagnostic settings for Network Security Groups": 
    {
      "value" :"*" 
    },
  "Certificate thumbprints": 
    {
      "value" :"*" 
    }
  
}
PARAMETERS

}