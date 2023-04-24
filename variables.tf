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

variable "smart_detection_rules" {
  description = "A map of smart detection rules to configure for this Application Insights component."

  type = map(object({
    name = string

    enabled                            = optional(bool, true)
    send_emails_to_subscription_owners = optional(bool, true)
    additional_email_recipients        = optional(list(string), [])
  }))

  default = {
    "slow_page_load_time" = {
      name = "Slow page load time"
    }

    "slow_server_response_time" = {
      name = "Slow server response time"
    }

    "long_dependency_duration" = {
      name = "Long dependency duration"
    }

    "degradation_in_server_response_time" = {
      name = "Degradation in server response time"
    }

    "degradation_in_dependency_duration" = {
      name = "Degradation in dependency duration"
    }

    "degradation_in_trace_severity_ratio" = {
      name = "Degradation in trace severity ratio"
    }

    "abnormal_rise_in_exception_volume" = {
      name = "Abnormal rise in exception volume"
    }

    "potential_memory_leak_detected" = {
      name = "Potential memory leak detected"
    }

    "potential_security_issue_detected" = {
      name = "Potential security issue detected"
    }

    "abnormal_rise_in_daily_data_volume" = {
      name = "Abnormal rise in daily data volume"
    }
  }
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
