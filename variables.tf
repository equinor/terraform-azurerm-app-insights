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

variable "smart_detector_alert_rule_name_template" {
  description = "The template to use for smart detector alert rule names. Available template variables are \"smart_detector_alert_rule_name\" and \"component_name\"."
  type        = string
  default     = "$${smart_detector_alert_rule_name} - $${component_name}"
  nullable    = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
