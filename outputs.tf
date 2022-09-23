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

output "action_group_name" {
  description = "The name of this action group."
  value       = azurerm_monitor_action_group.this.name
}

output "action_group_id" {
  description = "The ID of this action group."
  value       = azurerm_monitor_action_group.this.name
}
