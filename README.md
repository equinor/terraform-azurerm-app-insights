# Terraform module for Azure Application Insights

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-app-insights)](https://github.com/equinor/terraform-azurerm-app-insights/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-app-insights/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure Application Insights resources.

## Features

- Workspace-based Application Insights component created in specified resource group.
- Smart detector alerts sent to given action group.

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Log Analytics workspace scope.

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

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
