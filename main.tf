locals {
  chart_ids_by_reference = merge(
    { for chart_id, chart_values in var.signalfx_time_charts : chart_id => signalfx_time_chart.this[chart_id].id },
    {
      for chart_id, chart_values in var.signalfx_single_value_charts : chart_id =>
      signalfx_single_value_chart.this[chart_id].id
    },
    { for chart_id, chart_values in var.signalfx_list_charts : chart_id => signalfx_list_chart.this[chart_id].id },
    { for chart_id, chart_values in var.signalfx_log_views : chart_id => signalfx_log_view.this[chart_id].id },
    { for chart_id, chart_values in var.signalfx_table_charts : chart_id => signalfx_table_chart.this[chart_id].id },
    { for chart_id, chart_values in var.signalfx_text_charts : chart_id => signalfx_text_chart.this[chart_id].id },
  )
}
