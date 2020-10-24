# Provider 
variable "agent_client_id" {}

variable "agent_client_secret" {}

variable "subscription_id" {}
variable "tenant_id" {}

variable "app_service_name" {}

locals {
  service_name = "octodemo-web"

  tags = {
    "OWNER"     = "octodemo"
    "TERRAFORM" = "true"
  }
}
