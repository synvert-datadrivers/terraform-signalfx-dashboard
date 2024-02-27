# SignalFX Dashboard

The module creates SignalFX Dashboards specified by the input parameters which follow dashboard export function scheme. The module can create a dashboard group and add the dashboard to the group if specified or add a dashboard to an existing group.

This module uses the [SignalFX Terraform Provider](https://registry.terraform.io/providers/splunk-terraform/signalfx/).

You can directly use the dashboard exported json as input with our [synvert-datadrivers/terraform-signalfx-dashboard-converter module](https://registry.terraform.io/modules/synvert-datadrivers/dashboard-converter/signalfx).

## Documentation

The module is documented using the terraform-docs.

### Examples

Examples can be found in the [examples](./examples) directory.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_signalfx"></a> [signalfx](#requirement\_signalfx) | ~> 9.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_signalfx"></a> [signalfx](#provider\_signalfx) | ~> 9.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [signalfx_dashboard.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/dashboard) | resource |
| [signalfx_dashboard_group.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/dashboard_group) | resource |
| [signalfx_list_chart.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/list_chart) | resource |
| [signalfx_log_view.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/log_view) | resource |
| [signalfx_single_value_chart.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/single_value_chart) | resource |
| [signalfx_table_chart.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/table_chart) | resource |
| [signalfx_text_chart.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/text_chart) | resource |
| [signalfx_time_chart.this](https://registry.terraform.io/providers/splunk-terraform/signalfx/latest/docs/resources/time_chart) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_dashboard_group"></a> [create\_dashboard\_group](#input\_create\_dashboard\_group) | Whether to create a dashboard group to add the dashboard to. | `bool` | `false` | no |
| <a name="input_dashboard_group_id"></a> [dashboard\_group\_id](#input\_dashboard\_group\_id) | The id of an existing dashboard group to add charts. | `string` | `null` | no |
| <a name="input_dashboard_group_parameters"></a> [dashboard\_group\_parameters](#input\_dashboard\_group\_parameters) | Map of parameters to set on the dashboard group. Key is the parameter name, value is the parameter value. | `any` | `{}` | no |
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | The name of the dashboard. | `string` | n/a | yes |
| <a name="input_dashboard_parameters"></a> [dashboard\_parameters](#input\_dashboard\_parameters) | Map of parameters to set on the dashboard. Key is the parameter name, value is the parameter value. | `any` | `{}` | no |
| <a name="input_signalfx_list_charts"></a> [signalfx\_list\_charts](#input\_signalfx\_list\_charts) | Map of list charts to create. Key is an id, value is chart config. | `any` | `{}` | no |
| <a name="input_signalfx_log_views"></a> [signalfx\_log\_views](#input\_signalfx\_log\_views) | Map of list charts to create. Key is an id, value is chart config. | `any` | `{}` | no |
| <a name="input_signalfx_single_value_charts"></a> [signalfx\_single\_value\_charts](#input\_signalfx\_single\_value\_charts) | Map of single value charts to create. Key is an id, value is chart config. | `any` | `{}` | no |
| <a name="input_signalfx_table_charts"></a> [signalfx\_table\_charts](#input\_signalfx\_table\_charts) | Map of table charts to create. Key is an id, value is chart config. | `any` | `{}` | no |
| <a name="input_signalfx_text_charts"></a> [signalfx\_text\_charts](#input\_signalfx\_text\_charts) | Map of text charts to create. Key is an id, value is chart config. | `any` | `{}` | no |
| <a name="input_signalfx_time_charts"></a> [signalfx\_time\_charts](#input\_signalfx\_time\_charts) | Map of time charts to create. Key is an id, value is chart config. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_signalfx_charts"></a> [signalfx\_charts](#output\_signalfx\_charts) | map of the SignalFx charts |
| <a name="output_signalfx_dashboard"></a> [signalfx\_dashboard](#output\_signalfx\_dashboard) | object of the SignalFx dashboard |
| <a name="output_signalfx_dashboard_group"></a> [signalfx\_dashboard\_group](#output\_signalfx\_dashboard\_group) | object of the SignalFx dashboard group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
