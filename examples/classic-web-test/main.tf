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

data "local_file" "example" {
  filename = "${path.module}/example.xml"
}

module "classic_web_test" {
  # source = "github.com/equinor/terraform-azurerm-app-insights//modules/web-test?ref=v0.0.0"
  source = "../../modules/web-test"

  name                = "classic-web-test-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  component_id        = module.app_insights.component_id

  configuration = data.local_file.example.content
  kind          = "ping"
}
