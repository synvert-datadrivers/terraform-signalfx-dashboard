resource "signalfx_single_value_chart" "this" {
  for_each = var.signalfx_single_value_charts

  name         = each.value.name
  program_text = each.value.program_text

  max_delay           = lookup(each.value, "max_delay", null)
  refresh_interval    = lookup(each.value, "refresh_interval", null)
  max_precision       = lookup(each.value, "max_precision", null)
  is_timestamp_hidden = lookup(each.value, "is_timestamp_hidden", null)
  color_by            = lookup(each.value, "color_by", null)

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
