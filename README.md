# Terraform module for Azure Application Insights

Terraform module which creates Azure Application Insights resources.

## Features

- Workspace-based Application Insights component created in specified resource group.
- Microsoft Entra authentication enabled by default (see [notes](#microsoft-entra-authentication)).
- Daily data volume cap set to 10 GB by default to protect against unexpected spikes in data volume.
- Alerts sent to given Azure Monitor action group:
  - Daily data volume cap reached
  - Dependency latency degradation
  - Exception anomalies
  - Failure anomalies
  - Potential memory leak
  - Response latency degradation
  - Trace severity degradation

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Azure Log Analytics workspace scope.
- Azure role `Monitoring Contributor` at the Azure Monitor action group scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "app_insights" {
  source = "equinor/app-insights/azurerm"
  version = "~> 5.4"

  component_name      = "example-component"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  workspace_id        = module.log_analytics.workspace_id
  action_group_id     = azurerm_monitor_action_group.example.id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "log_analytics" {
  source = "equinor/app-insights/azurerm"
  version = "~> 2.4"

  workspace_name      = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example-ag"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "alerts"
  enabled             = true

  arm_role_receiver {
    name                    = "Notify Monitoring Readers"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
}
```

## Notes

### Microsoft Entra authentication

Microsoft Entra authentication is enabled by default. Web Apps and Functions Apps require additional configuration to authenticate using Microsoft Entra:

- [Add a managed identity to the Web App or Function App](https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity).
- Assign Azure role `Monitoring Metrics Publisher` to the managed identity at the Application Insights resource scope.
- Add an app setting `APPLICATIONINSIGHTS_AUTHENTICATION_STRING` and set the value to `Authorization=AAD` (for system-assigned identity) or `Authorization=AAD;ClientId={Client ID of the user-assigned identity}` (for user-assigned identity).

Please refer to [Microsoft Entra authentication for Application Insights documentation](https://learn.microsoft.com/en-us/azure/azure-monitor/app/azure-ad-authentication) for more information.

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
