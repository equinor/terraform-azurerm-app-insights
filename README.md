# Azure Application Insights Terraform module

Terraform module which creates an Azure Application Insights resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_component"></a> [component](#module\_component) | ./modules/component | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_components"></a> [components](#input\_components) | n/a | <pre>map(object({<br>    name = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to create the resources in. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace to send diagnostics to. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to create the resources in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_component_ids"></a> [component\_ids](#output\_component\_ids) | A mapping of IDs for these Application Insights components. |
| <a name="output_connection_strings"></a> [connection\_strings](#output\_connection\_strings) | A mapping of connection strings for these Application Insights components. |
| <a name="output_instrumentation_keys"></a> [instrumentation\_keys](#output\_instrumentation\_keys) | A mapping of instrumentation keys for these Application Insights components. |
| <a name="output_smart_detection_action_group_id"></a> [smart\_detection\_action\_group\_id](#output\_smart\_detection\_action\_group\_id) | The ID of this Smart Detection action group. |
| <a name="output_smart_detection_action_group_name"></a> [smart\_detection\_action\_group\_name](#output\_smart\_detection\_action\_group\_name) | The name of this Smart Detection action group. |
<!-- END_TF_DOCS -->
