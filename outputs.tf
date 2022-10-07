output "component_ids" {
  description = "A map of identifier => Application Insights component IDs."
  value = {
    for k, v in module.component : k => v.id
  }
}

output "instrumentation_keys" {
  description = "A map of identifier => Application Insights component instrumentation keys."
  value = {
    for k, v in module.component : k => v.instrumentation_key
  }
  sensitive = true
}

output "connection_strings" {
  description = "A map of identifier => Application Insights component connection strings."
  value = {
    for k, v in module.component : k => v.connection_string
  }
  sensitive = true
}

output "smart_detection_action_group_name" {
  description = "The name of this Smart Detection action group."
  value       = azurerm_monitor_action_group.this.name
}

output "smart_detection_action_group_id" {
  description = "The ID of this Smart Detection action group."
  value       = azurerm_monitor_action_group.this.id
}
