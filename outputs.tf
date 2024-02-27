output "signalfx_dashboard" {
  description = "object of the SignalFx dashboard"
  value       = signalfx_dashboard.this
}

output "signalfx_charts" {
  description = "map of the SignalFx charts"
  value = merge(
    { for chart_id, chart_values in signalfx_list_chart.this : chart_id => chart_values },
    { for chart_id, chart_values in signalfx_log_view.this : chart_id => chart_values },
    { for chart_id, chart_values in signalfx_table_chart.this : chart_id => chart_values },
    { for chart_id, chart_values in signalfx_text_chart.this : chart_id => chart_values },
    { for chart_id, chart_values in signalfx_time_chart.this : chart_id => chart_values },
    { for chart_id, chart_values in signalfx_single_value_chart.this : chart_id => chart_values },
  )
}

output "signalfx_dashboard_group" {
  description = "object of the SignalFx dashboard group"
  value       = try(signalfx_dashboard_group.this[0], { id = var.dashboard_group_id })
}
