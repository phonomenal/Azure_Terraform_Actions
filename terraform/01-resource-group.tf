resource "azurerm_resource_group" "main" {
  name     = "${var.requesting_team}-rg"
  location = var.location
  tags     = local.tags
}

resource "azurerm_policy_assignment" "HITRUST_HIPPA" {
  name                 = "HITRUST/HIPAA"
  scope                = azurerm_resource_group.main.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/a169a624-5599-4385-a696-c8d643089fab"
  description          = "This initiative includes audit and virtual machine extension deployment policies that address a subset of HITRUST/HIPAA controls. Additional policies will be added in upcoming releases. For more information, visit https://aka.ms/hipaa-blueprint."

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

  parameters = <<PARAMETERS
{
  "Application names (supports wildcards": "*",
  "Storage Account Prefix for Regional Storage Account to deploy diagnostic settings for Network Security Groups": "*",
  "Resource Group Name for Storage Account (must exist) to deploy diagnostic settings for Network Security Groups": "*",
  "Certificate thumbprints": "*"
  
}
PARAMETERS

}