# Terraform module for Azure Application Insights

[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/releases/latest)
[![Terraform Module Downloads](https://img.shields.io/terraform/module/dt/equinor/app-insights/azurerm)](https://registry.terraform.io/modules/equinor/app-insights/azurerm/latest)
[![GitHub contributors](https://img.shields.io/github/contributors/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/graphs/contributors)
[![GitHub Issues](https://img.shields.io/github/issues/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/issues)
[![GitHub Pull requests](https://img.shields.io/github/issues-pr/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/pulls)
[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/blob/main/LICENSE)

Terraform module which creates Azure Application Insights resources.

## Features

- Workspace-based Application Insights component created in specified resource group.
- Microsoft Entra authentication enabled by default (see [notes](#microsoft-entra-authentication)).
- Smart detector alerts sent to given action group.

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Log Analytics workspace scope.
- Azure role `Monitoring Contributor` at the action group scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "app_insights" {
  source = "equinor/app-insights/azurerm"
  version = "~> 5.3"

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
  name                = "Application Insights Smart Detection"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "SmartDetect"
  enabled             = true

  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }

  arm_role_receiver {
    name                    = "Monitoring Reader"
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
