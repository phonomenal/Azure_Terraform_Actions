---
name: Terraform Request - Azure App Service
about: Submit a request to create a new hosting environment for your app
title: Terraform Request for Azure App Service for <YourTeamName>
labels: terraform
assignees: ''

---

### Application Information
Requesting Team Name: 
Business Justification: 
Link to Application Repo: 


### Technical Information
**App Service Configuration:**
Update the below JSON with the appropriate values for your deployment (**DO NOT use spaces**):

```json
{
    "requesting_team": "Team-Name",
    "app_service_name": "Application-Name",
    "location": "eastus",
    "sku_tier": "Standard",
    "sku_size": "S1"
} 
```

### Security
**Compliance Requirements:**
- [ ] PCI-DSS (for apps that process payment information)
- [ ] HIPAA (for apps that store health information)
