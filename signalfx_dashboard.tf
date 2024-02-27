resource "signalfx_dashboard" "this" {
  name            = var.dashboard_name
  dashboard_group = var.create_dashboard_group ? signalfx_dashboard_group.this[0].id : var.dashboard_group_id

  time_range = lookup(var.dashboard_parameters, "time_range", null)

  dynamic "filter" {
    for_each = lookup(var.dashboard_parameters, "filters", {})
    content {
      property       = filter.value.property
      negated        = lookup(filter.value, "negated", null)
      values         = filter.value.values
      apply_if_exist = lookup(filter.value, "apply_if_exist", null)
    }
  }

  dynamic "variable" {
    for_each = lookup(var.dashboard_parameters, "variables", {})
    content {
      property               = variable.value.property
      alias                  = variable.value.alias
      description            = lookup(variable.value, "description", null)
      values                 = lookup(variable.value, "values", null)
      value_required         = lookup(variable.value, "value_required", null)
      values_suggested       = lookup(variable.value, "values_suggested", null)
      restricted_suggestions = lookup(variable.value, "restricted_suggestions", null)
      replace_only           = lookup(variable.value, "replace_only", null)
      apply_if_exist         = lookup(variable.value, "apply_if_exist", null)
    }
  }

  dynamic "chart" {
    for_each = lookup(var.dashboard_parameters, "charts", {})
    content {
      chart_id = local.chart_ids_by_reference[chart.key]
      width    = lookup(chart.value, "width", null)
      height   = lookup(chart.value, "height", null)
      row      = lookup(chart.value, "row", null)
      column   = lookup(chart.value, "column", null)
    }
  }
}
