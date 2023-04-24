resource "azurerm_application_insights" "this" {
  name                = var.component_name
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"
  workspace_id        = var.workspace_id

  tags = var.tags
}

resource "azurerm_application_insights_smart_detection_rule" "this" {
  for_each = var.smart_detection_rules

  name                               = each.value["name"]
  application_insights_id            = azurerm_application_insights.this.id
  enabled                            = true
  send_emails_to_subscription_owners = true
  additional_email_recipients        = []
}
