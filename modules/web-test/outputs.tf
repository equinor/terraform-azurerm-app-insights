output "id" {
  description = "The ID of this Web Test."
  value       = local.web_test.id
}

output "synthetic_monitor_id" {
  description = "The unique ID of this Web Test."
  value       = try(local.web_test.synthetic_monitor_id[0], null)
}
