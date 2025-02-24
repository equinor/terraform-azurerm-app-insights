resource "azurerm_application_insights" "this" {
  name                          = var.component_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  application_type              = "web"
  workspace_id                  = var.workspace_id
  local_authentication_disabled = var.local_authentication_disabled
  sampling_percentage           = var.sampling_percentage

  # Irrelevant when "workspace_id" is set.
  # Retention must be configured in Log Analytics workspace.
  retention_in_days = null

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "dependency_latency_degradation" {
  name                = coalesce(var.dependency_performance_degradation_detector_rule_name, "Dependency Latency Degradation - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "DependencyPerformanceDegradationDetector"
  description   = "Dependency Latency Degradation notifies you of an unusual increase in response by a dependency your app is calling (e.g. REST API or database)"
  severity      = "Sev3"
  frequency     = "P1D"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "exception_anomalies" {
  name                = coalesce(var.exception_volume_changed_detector_rule_name, "Exception Anomalies - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "ExceptionVolumeChangedDetector"
  description   = "Exception Anomalies notifies you of an unusual rise in the rate of exceptions thrown by your app."
  severity      = "Sev3"
  frequency     = "P1D"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "failure_anomalies" {
  name                = coalesce(var.failure_anomalies_detector_rule_name, "Failure Anomalies - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "FailureAnomaliesDetector"
  description   = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  severity      = "Sev3"
  frequency     = "PT1M"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "potential_memory_leak" {
  name                = coalesce(var.memory_leak_detector_rule_name, "Potential Memory Leak - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "MemoryLeakDetector"
  description   = "Potential Memory Leak notifies you of increased memory consumption pattern by your app which may indicate a potential memory leak."
  severity      = "Sev3"
  frequency     = "P1D"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "response_latency_degradation" {
  name                = coalesce(var.request_performance_degradation_detector_rule_name, "Response Latency Degradation - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "RequestPerformanceDegradationDetector"
  description   = "Response Latency Degradation notifies you of an unusual increase in latency in your app response to requests."
  severity      = "Sev3"
  frequency     = "P1D"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

resource "azurerm_monitor_smart_detector_alert_rule" "trace_severity_degradation" {
  name                = coalesce(var.trace_severity_detector_rule_name, "Trace Severity Degradation - ${var.component_name}")
  resource_group_name = var.resource_group_name
  scope_resource_ids  = [azurerm_application_insights.this.id]
  enabled             = true

  detector_type = "TraceSeverityDetector"
  description   = "Trace Severity Degradation notifies you of an unusual increase in the severity of the traces generated by your app."
  severity      = "Sev3"
  frequency     = "P1D"

  action_group {
    ids = [var.action_group_id]
  }

  tags = var.tags
}

# Ref: https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-smart-detections-migration#migrate-your-smart-detection-by-using-arm-templates
resource "azapi_update_resource" "this" {
  type      = "Microsoft.Insights/components/ProactiveDetectionConfigs@2018-05-01-preview"
  parent_id = azurerm_application_insights.this.id
  name      = "migrationToAlertRulesCompleted"

  body = {
    properties = {
      SendEmailsToSubscriptionOwners = false
      CustomEmails                   = []
      Enabled                        = true
    }
  }

  depends_on = [
    azurerm_monitor_smart_detector_alert_rule.dependency_latency_degradation,
    azurerm_monitor_smart_detector_alert_rule.exception_anomalies,
    azurerm_monitor_smart_detector_alert_rule.failure_anomalies,
    azurerm_monitor_smart_detector_alert_rule.potential_memory_leak,
    azurerm_monitor_smart_detector_alert_rule.response_latency_degradation,
    azurerm_monitor_smart_detector_alert_rule.trace_severity_degradation
  ]
}
