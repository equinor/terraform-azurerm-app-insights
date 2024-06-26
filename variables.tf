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

variable "action_group_id" {
  description = "The ID of the action group to send smart detector alerts to."
  type        = string
}

variable "dependency_performance_degradation_detector_rule_name" {
  description = "A name for this \"DependencyPerformanceDegradationDetector\" alert rule."
  type        = string
  default     = null
}

variable "exception_volume_changed_detector_rule_name" {
  description = "A name for this \"ExceptionVolumeChangedDetector\" alert rule."
  type        = string
  default     = null
}

variable "failure_anomalies_detector_rule_name" {
  description = "A name for this \"FailureAnomaliesDetector\" alert rule."
  type        = string
  default     = null
}

variable "memory_leak_detector_rule_name" {
  description = "A name for this \"MemoryLeakDetector\" alert rule."
  type        = string
  default     = null
}

variable "request_performance_degradation_detector_rule_name" {
  description = "A name for this \"RequestPerformanceDegradationDetector\" alert rule."
  type        = string
  default     = null
}

variable "trace_severity_detector_rule_name" {
  description = "A name for this \"TraceSeverityDetector\" alert rule."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
