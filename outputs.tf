output "component_name" {
  description = "The name of this Application Insights component."
  value       = module.component.name
}

output "component_id" {
  description = "The ID of this Application Insights component."
  value       = module.component.id
}

output "instrumentation_key" {
  description = "The instrumentation key of this Application Insights component."
  value       = module.component.instrumentation_key
  sensitive   = true
}

output "connection_string" {
  description = "The connection string of this Application Insights component."
  value       = module.component.connection_string
  sensitive   = true
}

output "smart_detection_action_group_name" {
  description = "The name of this Smart Detection action group."
  value       = azurerm_monitor_action_group.this.name
}

output "smart_detection_action_group_id" {
  description = "The ID of this Smart Detection action group."
  value       = azurerm_monitor_action_group.this.name
}
