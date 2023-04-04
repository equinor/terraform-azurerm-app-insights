provider "azurerm" {
  features {}
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${random_id.this.hex}"
  location = var.location
}

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.4.0"

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

module "app_insights" {
  # source = "github.com/equinor/terraform-azurerm-app-insights"
  source = "../.."

  component_name      = "appi-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  workspace_id        = module.log_analytics.workspace_id

  standard_web_test_name          = "ai-web-test-${random_id.this.hex}"
  standard_web_test_enabled       = true
  standard_web_test_retry_enabled = true

  standard_web_test_geo_locations = [
    "emea-gb-db3-azr" # North Europe
  ]

  standard_web_test_request = {
    url       = "http://www.example.com"
    http_verb = "GET"

    header = {}
  }

  standard_web_test_validation_rules = {
    exexpected_status_code      = 200
    ssl_cert_remaining_lifetime = 7
    ssl_check_enabled           = true

    content = []
  }
}
