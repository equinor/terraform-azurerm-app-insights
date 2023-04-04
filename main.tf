resource "azurerm_application_insights" "this" {
  name                = var.component_name
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"
  workspace_id        = var.workspace_id

  tags = var.tags
}

module "standard_web_test" {
  source = "./modules/standard_web_test"

  name                = var.standard_web_test_name
  resource_group_name = var.resource_group_name
  location            = var.location
  component_id        = azurerm_application_insights.this.id
  description         = var.standard_web_test_description
  enabled             = var.standard_web_test_enabled
  frequency           = var.standard_web_test_frequency
  retry_enabled       = var.standard_web_test_retry_enabled
  timeout             = var.standard_web_test_timeout
  geo_locations       = var.standard_web_test_geo_locations
  request             = var.standard_web_test_request
  validation_rules    = var.standard_web_test_validation_rules

  tags = var.tags
}
