# Provider 
variable "agent_client_id" {}
variable "agent_client_secret" {}

variable "subscription_id" {}
variable "tenant_id" {}

variable "app_service_name" {}
variable "location" {}

variable "requesting_team" {}

variable "sku_tier" {}
variable "sku_size" {}



locals {
  service_name = "octodemo-web"

  tags = {
    "OWNER"     = "octodemo"
    "TEAM"      = var.requesting_team
    "TERRAFORM" = "true"
  }
}
