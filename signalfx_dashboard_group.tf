resource "signalfx_dashboard_group" "this" {
  count = var.create_dashboard_group ? 1 : 0

  name                    = var.dashboard_group_parameters["name"]
  description             = var.dashboard_group_parameters["description"]
  teams                   = lookup(var.dashboard_group_parameters, "teams", null)
  authorized_writer_teams = lookup(var.dashboard_group_parameters, "authorized_writer_teams", null)
  authorized_writer_users = lookup(var.dashboard_group_parameters, "authorized_writer_users", null)

  dynamic "permissions" {
    for_each = lookup(var.dashboard_group_parameters, "permissions", [])
    content {
      principal_id   = permissions.value["principal_id"]
      principal_type = permissions.value["principal_type"]
      actions        = permissions.value["actions"]
    }
  }

  dynamic "dashboard" {
    for_each = lookup(var.dashboard_group_parameters, "dashboard", {})
    content {
      dashboard_id         = dashboard.value["dashboard_id"]
      name_override        = lookup(dashboard.value, "name_override", null)
      description_override = lookup(dashboard.value, "description_override", null)
      dynamic "filter_override" {
        for_each = lookup(dashboard.value, "filter_override", null)
        content {
          property = filter_override.value["property"]
          values   = filter_override.value["values"]
          negated  = lookup(filter_override.value, "negated", null)
        }
      }
      dynamic "variable_override" {
        for_each = lookup(dashboard.value, "variable_override", null)
        content {
          property         = filter_override.value["property"]
          values           = lookup(filter_override.value, "values", null)
          values_suggested = lookup(filter_override.value, "values_suggested", null)
        }
      }
    }
  }
}
