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
}

module "standard_web_test" {
  # source = "github.com/equinor/terraform-azurerm-app-insights//modules/web-test?ref=v0.0.0"
  source = "../../modules/web-test"

  name                = "standard-web-test-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  component_id        = module.app_insights.component_id

  description   = "Standard Web Test example."
  kind          = "standard"
  enabled       = true
  frequency     = 300
  retry_enabled = true
  timeout       = 30

  geo_locations = [
    "emea-gb-db3-azr", # North Europe
    "emea-nl-ams-azr"  # West Europe
  ]

  request = {
    body                             = "Standard Web Test request body."
    follow_redirects_enabled         = true
    http_verb                        = "GET"
    parse_dependent_requests_enabled = true
    url                              = "http://www.example.com"

    header = {}
  }

  validation_rules = {
    expected_status_code        = 200
    ssl_cert_remaining_lifetime = 7
    ssl_check_enabled           = true

    content = []
  }
}
