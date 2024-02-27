resource "signalfx_list_chart" "this" {
  for_each = var.signalfx_list_charts

  name         = each.value.name
  program_text = each.value.program_text

  description             = lookup(each.value, "description", null)
  unit_prefix             = lookup(each.value, "unit_prefix", null)
  color_by                = lookup(each.value, "color_by", null)
  max_delay               = lookup(each.value, "max_delay", null)
  timezone                = lookup(each.value, "timezone", null)
  disable_sampling        = lookup(each.value, "disable_sampling", null)
  refresh_interval        = lookup(each.value, "refresh_interval", null)
  hide_missing_values     = lookup(each.value, "hide_missing_values", null)
  legend_fields_to_hide   = lookup(each.value, "legend_fields_to_hide", null)
  max_precision           = lookup(each.value, "max_precision", null)
  secondary_visualization = lookup(each.value, "secondary_visualization", null)
  sort_by                 = lookup(each.value, "sort_by", null)
  time_range              = lookup(each.value, "time_range", null)
  start_time              = lookup(each.value, "start_time", null)
  end_time                = lookup(each.value, "end_time", null)

  dynamic "viz_options" {
    for_each = lookup(each.value, "viz_options", {})
    content {
      label        = viz_options.value.label
      display_name = lookup(viz_options.value, "display_name", null)
      color        = viz_options.value.color
      value_unit   = lookup(viz_options.value, "value_unit", null)
      value_prefix = lookup(viz_options.value, "value_prefix", null)
      value_suffix = lookup(viz_options.value, "value_suffix", null)
    }
  }
  dynamic "legend_options_fields" {
    for_each = lookup(each.value, "legend_options_fields", [])
    content {
      property = legend_options_fields.value.property
      enabled  = lookup(legend_options_fields.value, "enabled", null)
    }
  }
  dynamic "color_scale" {
    for_each = lookup(each.value, "color_scales", {})
    content {
      gt    = lookup(color_scale.value, "gt", null)
      gte   = lookup(color_scale.value, "gte", null)
      lt    = lookup(color_scale.value, "lt", null)
      lte   = lookup(color_scale.value, "lte", null)
      color = color_scale.value.color
    }
  }
}
