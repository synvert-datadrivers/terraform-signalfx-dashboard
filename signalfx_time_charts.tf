resource "signalfx_time_chart" "this" {
  for_each = var.signalfx_time_charts

  name         = each.value.name
  program_text = each.value.program_text

  time_range                = lookup(each.value, "time_range", null)
  plot_type                 = lookup(each.value, "plot_type", null)
  show_data_markers         = lookup(each.value, "show_data_markers", null)
  show_event_lines          = lookup(each.value, "show_event_lines", null)
  color_by                  = lookup(each.value, "color_by", null)
  on_chart_legend_dimension = lookup(each.value, "on_chart_legend_dimension", null)

  dynamic "axis_left" {
    for_each = [{ for k, v in lookup(each.value, "axis_left", {}) : k => v if v != null }]
    content {
      label                = lookup(axis_left.value, "label", null)
      min_value            = lookup(axis_left.value, "min_value", null)
      max_value            = lookup(axis_left.value, "max_value", null)
      high_watermark       = lookup(axis_left.value, "high_watermark", null)
      high_watermark_label = lookup(axis_left.value, "high_watermark_label", null)
      low_watermark        = lookup(axis_left.value, "low_watermark", null)
      low_watermark_label  = lookup(axis_left.value, "low_watermark_label", null)
    }
  }
  dynamic "axis_right" {
    for_each = [{ for k, v in lookup(each.value, "axis_right", {}) : k => v if v != null }]
    content {
      label                = lookup(axis_right.value, "label", null)
      min_value            = lookup(axis_right.value, "min_value", null)
      max_value            = lookup(axis_right.value, "max_value", null)
      high_watermark       = lookup(axis_right.value, "high_watermark", null)
      high_watermark_label = lookup(axis_right.value, "high_watermark_label", null)
      low_watermark        = lookup(axis_right.value, "low_watermark", null)
      low_watermark_label  = lookup(axis_right.value, "low_watermark_label", null)
    }
  }

  dynamic "viz_options" {
    for_each = lookup(each.value, "viz_options", {})
    content {
      label        = viz_options.value.label
      display_name = lookup(viz_options.value, "display_name", null)
      color        = viz_options.value.color
      axis         = lookup(viz_options.value, "axis", null)
      plot_type    = lookup(viz_options.value, "plot_type", null)
      value_unit   = lookup(viz_options.value, "value_unit", null)
      value_prefix = lookup(viz_options.value, "value_prefix", null)
      value_suffix = lookup(viz_options.value, "value_suffix", null)
    }
  }
}
