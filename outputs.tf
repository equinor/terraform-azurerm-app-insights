output "component_ids" {
  description = "A mapping of IDs for these Application Insights components."
  value = {
    for k, v in module.component : k => v.id
  }
}

output "instrumentation_keys" {
  description = "A mapping of instrumentation keys for these Application Insights components."
  value = {
    for k, v in module.component : k => v.instrumentation_key
  }
  sensitive = true
}

output "connection_strings" {
  description = "A mapping of connection strings for these Application Insights components."
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
