# Provider 
variable "agent_client_id" {}
variable "agent_client_secret" {}

variable "subscription_id" {}
variable "tenant_id" {}

variable "app_service_name" {
  type          = string
  description   = "The requested name for the Azure App Service, must be unique"
}

variable "location" {
  type          = string
  default       = "eastus"
  description   = "The Azure region location for the Resource Group where instances will be created"

  validation {
    condition     = contains(["eastus", "eastus2", "centralUS", "northcentralus", "southcentralus"], var.location)
    error_message = "The Azure region location needs to be one of the approved choices"
  }
}

variable "requesting_team" {
  type          = string
  description   = "The name of the team requesting these Azure resources"

}

variable "sku_tier" {
  type          = string
  default       = "Standard"
  description   = "The Azure SKU Tier for the requested Resource"

}
variable "sku_size" {
  type          = string
  default       = "S1"
  description   = "The Azure SKU Size for the requested Resource"

}


locals {
  service_name = "${var.requesting_team}-web"

  tags = {
    "OWNER"     = "octodemo-org"
    "TEAM"      = var.requesting_team
    "TERRAFORM" = "true"
  }
}
