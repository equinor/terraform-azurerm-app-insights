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

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.4.0"

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
}

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

module "app_insights" {
  source = "equinor/app-insights/azurerm"
  version = "5.1.0"

  component_name      = "appi-${random_id.this.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  workspace_id        = module.log_analytics.workspace_id
  action_group_id     = azurerm_monitor_action_group.this.id

  dependency_performance_degradation_detector_rule_name = "${module.app_insights.component_name} - Dependency Latency Degradation"  # Optional
  exception_volume_changed_detector_rule_name           = "${module.app_insights.component_name} - Exception Anomalies"             # Optional
  failure_anomalies_detector_rule_name                  = "${module.app_insights.component_name} - Failure Anomalies"               # Optional
  memory_leak_detector_rule_name                        = "${module.app_insights.component_name} - Potential Memory Leak"           # Optional
  request_performance_degradation_detector_rule_name    = "${module.app_insights.component_name} - Response Latency Degradation"    # Optional
  trace_severity_detector_rule_name                     = "${module.app_insights.component_name} - Trace Severity Degradation"      # Optional
}
