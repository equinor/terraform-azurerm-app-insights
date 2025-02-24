moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["dependency_latency_degradation"]
  to   = azurerm_monitor_smart_detector_alert_rule.dependency_latency_degradation
}

moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["exception_anomalies"]
  to   = azurerm_monitor_smart_detector_alert_rule.exception_anomalies
}

moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["failure_anomalies"]
  to   = azurerm_monitor_smart_detector_alert_rule.failure_anomalies
}

moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["potential_memory_leak"]
  to   = azurerm_monitor_smart_detector_alert_rule.potential_memory_leak
}

moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["response_latency_degradation"]
  to   = azurerm_monitor_smart_detector_alert_rule.response_latency_degradation
}

moved {
  from = azurerm_monitor_smart_detector_alert_rule.this["trace_severity_degradation"]
  to   = azurerm_monitor_smart_detector_alert_rule.trace_severity_degradation
}
