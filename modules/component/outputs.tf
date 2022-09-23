output "name" {
  description = "The name of this Application Insights component."
  value       = azurerm_application_insights.this.name
}

output "id" {
  description = "The ID of this Application Insights component."
  value       = azurerm_application_insights.this.id
}

output "instrumentation_key" {
  description = "The instrumentation key of this Application Insights component."
  value       = azurerm_application_insights.this.instrumentation_key
  sensitive   = true
}

output "connection_string" {
  description = "The connection string of this Application Insights component."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}
