resource "signalfx_log_view" "this" {
  for_each = var.signalfx_log_views

  name         = each.value.name
  program_text = each.value.program_text

  description        = lookup(each.value, "description", null)
  time_range         = lookup(each.value, "time_range", null)
  start_time         = lookup(each.value, "start_time", null)
  end_time           = lookup(each.value, "end_time", null)
  default_connection = lookup(each.value, "default_connection", null)

  dynamic "columns" {
    for_each = lookup(each.value, "columns", [])
    content {
      name = columns.value
    }
  }
  dynamic "sort_options" {
    for_each = lookup(each.value, "sort_options", []) != null ? each.value.sort_options : []
    content {
      descending = sort_options.value.descending
      field      = sort_options.value.field
    }
  }
}
