resource "signalfx_table_chart" "this" {
  for_each = var.signalfx_table_charts

  name         = each.value.name
  program_text = each.value.program_text
  description  = lookup(each.value, "description", null)
  group_by     = lookup(each.value, "group_by", [])
}
