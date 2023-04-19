locals {
  is_standard = var.kind == "standard"
  web_test    = local.is_standard ? azurerm_application_insights_standard_web_test.this[0] : azurerm_application_insights_web_test.this[0]
}

resource "azurerm_application_insights_standard_web_test" "this" {
  count = local.is_standard ? 1 : 0

  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  application_insights_id = var.component_id

  description   = var.description
  enabled       = var.enabled
  frequency     = var.frequency
  retry_enabled = var.retry_enabled
  timeout       = var.timeout

  geo_locations = var.geo_locations

  request {
    url                              = var.request_url
    body                             = var.request_body
    follow_redirects_enabled         = var.request_follow_redirects_enabled
    http_verb                        = var.request_http_verb
    parse_dependent_requests_enabled = var.request_parse_dependent_requests_enabled

    dynamic "header" {
      for_each = var.request_header

      content {
        name  = var.request_header["name"]
        value = var.request_header["value"]
      }
    }
  }

  dynamic "validation_rules" {
    for_each = var.validation_rules != null ? [var.validation_rules] : []

    content {
      expected_status_code        = validation_rules.value["expected_status_code"]
      ssl_cert_remaining_lifetime = validation_rules.value["ssl_cert_remaining_lifetime"]
      ssl_check_enabled           = validation_rules.value["ssl_check_enabled"]

      dynamic "content" {
        for_each = validation_rules.value["content"]

        content {
          content_match      = content.value["content_match"]
          ignore_case        = content.value["ignore_case"]
          pass_if_text_found = content.value["pass_if_text_found"]
        }
      }
    }
  }

  tags = var.tags

  lifecycle {
    precondition {
      condition     = var.request_url != null
      error_message = "request_url is required when Web Test kind is set to \"standard\"."
    }
  }
}

resource "azurerm_application_insights_web_test" "this" {
  count = local.is_standard ? 0 : 1

  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  application_insights_id = var.component_id

  description   = var.description
  enabled       = var.enabled
  kind          = var.kind
  frequency     = var.frequency
  timeout       = var.timeout
  retry_enabled = var.retry_enabled

  geo_locations = var.geo_locations

  configuration = var.configuration

  tags = var.tags
}
