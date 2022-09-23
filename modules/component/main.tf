resource "azurerm_application_insights" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"
  workspace_id        = var.log_analytics_workspace_id

  tags = var.tags
}

# Configure a Failure Anomalies alert rule.
# Docs: https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/proactive-arm-config#failure-anomalies-alert-rule
resource "azurerm_monitor_smart_detector_alert_rule" "this" {
  name                = "Failure Anamolies - ${azurerm_application_insights.this.name}"
  resource_group_name = var.resource_group_name
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  enabled             = true
  severity            = "Sev3"
  frequency           = "PT1M"
  detector_type       = "FailureAnomaliesDetector"
  scope_resource_ids  = [azurerm_application_insights.this.id]

  action_group {
    ids = [var.smart_detection_action_group_id]
  }
}
