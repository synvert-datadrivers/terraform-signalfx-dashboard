resource "signalfx_text_chart" "this" {
  for_each = var.signalfx_text_charts

  name        = each.value.name
  description = lookup(each.value, "description", null)
  markdown    = each.value.markdown
}
