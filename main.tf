# Create Smart Detection action group.
# Docs: https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/proactive-failure-diagnostics
resource "azurerm_monitor_action_group" "this" {
  name                = "Application Insights Smart Detection"
  resource_group_name = var.resource_group_name
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

module "component" {
  for_each = var.components
  source   = "./modules/component"

  name                            = each.value.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  smart_detection_action_group_id = azurerm_monitor_action_group.this.id

  tags = var.tags
}
