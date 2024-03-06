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

variable "action_group_id" {
  description = "The ID of the action group to send smart detector alerts to."
  type        = string
}

variable "dependency_performance_degradation_detector_rule_name" {
  description = "A name for this dependency perfomance degradation detector alert rule."
  type        = string
  default     = null
}

variable "exception_volume_changed_detector_rule_name" {
  description = "A name for this exception volume changed detector alert rule."
  type        = string
  default     = null
}

variable "failure_anomalies_detector_rule_name" {
  description = "A name for this failure anomalies detector alert rule."
  type        = string
  default     = null
}

variable "memory_leak_detector_rule_name" {
  description = "A name for this potential memory leak detector alert rule."
  type        = string
  default     = null
}

variable "request_performance_degradation_detector_rule_name" {
  description = "A name for this response latency degradation detector alert rule."
  type        = string
  default     = null
}

variable "trace_severity_detector_rule_name" {
  description = "A name for this trace severity detector alert rule."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
