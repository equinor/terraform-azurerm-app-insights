variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "component_id" {
  description = "The Application Insights component ID."
  type        = string
}

variable "name" {
  description = "The name of this Web Test."
  type        = string
}

variable "configuration" {
  description = "An XML configuration specification for this Web Test. Required for Classic Web Test."
  type        = string
  default     = null
}

variable "kind" {
  description = "The kind of web test that this Web Test watches. Accepted values for Classic Web Test is `ping` or `multistep`."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "ping", "multistep"], var.kind)
    error_message = "Web Test kind must be \"standard\", \"ping\" or \"multistep\"."
  }
}

variable "description" {
  description = "The purpose/user defined description of this Web Test."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Is this Web Test enabled?"
  type        = bool
  default     = true
}

variable "frequency" {
  description = "Interval in seconds between test runs for this Web Test."
  type        = number
  default     = 300
}

variable "retry_enabled" {
  description = "Is retry on Web Test failure enabled?"
  type        = bool
  default     = true
}

variable "timeout" {
  description = "Seconds until this Web Test will timeout and fail."
  type        = number
  default     = 30
}

variable "geo_locations" {
  description = "A list of physical locations to run this Web Test."
  type        = list(string)

  default = [
    "emea-nl-ams-azr",  # West Europe
    "us-ca-sjc-azr",    # West US
    "apac-jp-kaw-edge", # Japan East
    "emea-ch-zrh-edge", # France South
    "emea-au-syd-edge"  # Australia East
  ]
}

variable "request_url" {
  description = "The request URL for this Web Test. Required for Standard Web Test."
  type        = string
  default     = null
}

variable "request_body" {
  description = "The request body for this Web Test. Optional for Standard Web Test."
  type        = string
  default     = null
}

variable "request_follow_redirects_enabled" {
  description = "Should the following of redirects be enabled for this Web Test. Optional for Standard Web Test."
  type        = bool
  default     = false
}

variable "request_http_verb" {
  description = "Which HTTP verb to use for the request call for this Web Test. Optional for Standard Web Test."
  type        = string
  default     = "GET"
}

variable "request_parse_dependent_requests_enabled" {
  description = "Should the parsing of dependend requests be enabled for this Web Test? Optional for Standard Web Test."
  type        = bool
  default     = false
}

variable "request_header" {
  description = "The name and value which should be used for the request header for this Web Test. Optional for Standard Web Test."

  type = list(object({
    name  = string
    value = string
  }))

  default = []
}

variable "validation_rules" {
  description = "The validation rules for this Web Test. Optional for Standard Web Test."

  type = object({
    expected_status_code        = optional(number, 200)
    ssl_cert_remaining_lifetime = optional(number, 7)
    ssl_check_enabled           = optional(bool, true)

    content = optional(list(object({
      content_match      = string
      ignore_case        = optional(bool, false)
      pass_if_text_found = optional(bool, true)
    })), [])
  })

  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
