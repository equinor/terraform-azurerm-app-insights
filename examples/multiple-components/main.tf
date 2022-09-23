provider "azurerm" {
  features {}
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${random_id.this.hex}"
  location = var.location
}

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.1.0"

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

module "app_insights" {
  # source = "github.com/equinor/terraform-azurerm-app-insights?ref=v0.0.0"
  source = "../.."

  component_name             = "appi-${random_id.this.hex}-001"
  resource_group_name        = azurerm_resource_group.this.name
  location                   = azurerm_resource_group.this.location
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

module "app_insights_component" {
  # source = "github.com/equinor/terraform-azurerm-app-insights//modules/component?ref=v0.0.0"
  source = "../../modules/component"

  name                            = "appi-${random_id.this.hex}-002"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  log_analytics_workspace_id      = module.log_analytics.workspace_id
  smart_detection_action_group_id = module.app_insights.smart_detection_action_group_id
}