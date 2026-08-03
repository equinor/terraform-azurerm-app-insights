variable "component_name" {
  description = "The name of this Application Insights component."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics to."
  type        = string
}

variable "local_authentication_disabled" {
  description = "Should local authentication be disabled for this Application Insights component? If true, the \"Monitoring Metrics Publisher\" role is required for Microsoft Entra authentication."
  type        = bool
  default     = true
}

variable "sampling_percentage" {
  description = "Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry."
  type        = number
  default     = 100
}

variable "daily_data_cap_in_gb" {
  description = "The daily data volume cap in GB for this Application Insights component."
  type        = number
  nullable    = false
  default     = 10
}

variable "daily_data_cap_notifications_disabled" {
  description = "Should email notifications be disabled when the daily data cap is reached?"
  type        = bool
  nullable    = false
  default     = false
}

variable "action_group_id" {
  description = "The ID of the action group to send alerts to."
  type        = string
  nullable    = false
}

variable "daily_cap_reached_alert_rule_name" {
  description = "A custom name for this Daily Data Volume Cap Reached alert rule. If value is set to null, the default name \"Daily Data Volume Cap Reached - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "dependency_performance_degradation_detector_rule_name" {
  description = "A custom name for this Dependency Latency Degradation alert rule. If value is set to null, the default name \"Dependency Latency Degradation - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "exception_volume_changed_detector_rule_name" {
  description = "A custom name for this Exception Anomalies alert rule. If value is set to null, the default name \"Exception Anomalies - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "failure_anomalies_detector_rule_name" {
  description = "A custom name for this Failure Anomalies alert rule. If value is set to null, the default name \"Failure Anomalies - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "memory_leak_detector_rule_name" {
  description = "A custom name for this Potential Memory Leak alert rule. If value is set to null, the default name \"Potential Memory Leak - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "request_performance_degradation_detector_rule_name" {
  description = "A custom name for this Response Latency Degradation alert rule. If value is set to null, the default name \"Response Latency Degradation - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "trace_severity_detector_rule_name" {
  description = "A custom name for this Trace Severity Degradation alert rule. If value is set to null, the default name \"Trace Severity Degradation - <Application Insights resource name>\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
