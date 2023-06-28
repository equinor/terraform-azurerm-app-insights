provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false # Optional
    }
  }
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${random_id.this.hex}"
  location = var.location
}

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.4.0"

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

resource "azurerm_monitor_action_group" "this" {
  name                = "Application Insights Smart Detection"
  resource_group_name = azurerm_resource_group.this.name
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

module "app_insights" {
  # source = "github.com/equinor/terraform-azurerm-app-insights"
  source = "../.."

  component_name      = "appi-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  workspace_id        = module.log_analytics.workspace_id
  action_group_id     = azurerm_monitor_action_group.this.id
}

module "standard_web_test" {
  # source = "github.com/equinor/terraform-azurerm-app-insights//modules/web-test?ref=v0.0.0"
  source = "../../modules/web-test"

  name                = "standard-web-test-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  component_id        = module.app_insights.component_id
  kind                = "standard"

  request_url = "https://www.example.com"
}
