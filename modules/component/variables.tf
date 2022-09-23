variable "name" {
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

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics to."
  type        = string
}

variable "action_group_ids" {
  description = "A list of IDs for the action groups"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
