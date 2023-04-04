locals {
  enabled_web_test  = var.enabled == true
  standard_web_test = local.enabled_web_test ? azurerm_application_insights_standard_web_test.this[0] : null
}

resource "azurerm_application_insights_standard_web_test" "this" {
  count = local.enabled_web_test ? 1 : 0

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

  dynamic "request" {
    for_each = var.request != null ? [var.request] : []

    content {
      url                              = request.value["url"]
      follow_redirects_enabled         = request.value["follow_redirects_enabled"]
      http_verb                        = request.value["http_verb"]
      parse_dependent_requests_enabled = request.value["parse_dependent_requests_enabled"]

      dynamic "header" {
        for_each = request.value["header"]

        content {
          name  = header.value["name"]
          value = header.value["value"]
        }
      }
    }
  }

  dynamic "validation_rules" {
    for_each = var.validation_rules != null ? [var.validation_rules] : []

    content {
      expected_status_code = validation_rules.value["expected_status_code"]

      ssl_cert_remaining_lifetime = validation_rules.value["ssl_cert_remaining_lifetime"]

      ssl_check_enabled = validation_rules.value["ssl_check_enabled"]

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
}
