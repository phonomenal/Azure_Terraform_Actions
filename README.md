# README
## About
Using GitHub Actions for Azure deployments with Terraform! Deploys an Azure resource group and app service, utilizing the [Terraform Azure Provider](https://www.terraform.io/docs/providers/azurerm/).


## Getting Started
### Generate Azure Service Principal
To deploy to Azure you will need to create a service principal. You can do that with the following command:

```sh
az ad sp create-for-rbac --name {yourServicePrincipalName} --role contributor \
                            --scopes /subscriptions/{subscription-id} \
                            --sdk-auth

  # Replace {yourServicePrincipalName}, {subscription-id} with the a service principal name and subscription id.

  # The command should output a JSON object similar to the example below

  {
    "clientId": "<GUID>",
    "clientSecret": "<GUID>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    (...)
  }
```

  - *This service principal does the work but is probably way too powerful for what you need, you might want to consider reducing its privileges, check the [docs](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest) to know more!*
  
### Creating GitHub Secrets
Add the JSON output as the following secrets in the GitHub repository:

`TF_VAR_agent_client_id` 
`TF_VAR_agent_client_secret` 
`TF_VAR_subscription_id` 
`TF_VAR_tenant_id` 

For steps to create and storing secrets, please check [here](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)

### Triggering the workflow
The workflow file is located in `./github/workflows/main.yaml` 

You can setup workflow triggers on dozens of different GitHub event, manual, and webhook events! See: [Events that trigger workflows](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows)

## Referenced Projects/Posts:
**Azure deployments made easy with Terraform and Github actions.**
- https://github.com/pliyo/terraform-azure-github-actions
- https://medium.com/faun/azure-deployments-made-easy-with-terraform-and-github-actions-d459ae5ab7c7
