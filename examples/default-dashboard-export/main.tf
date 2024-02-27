locals {
  dashboards = {
    intro_splunk_observability_cloud = "./dashboard_Intro to Splunk Observability Cloud.json"
  }
}

module "converter" {
  source = "synvert-datadrivers/dashboard-converter/signalfx"

  for_each = local.dashboards

  dashboard_file_path = each.value
}

module "dashboard" {
  source   = "../.."
  for_each = local.dashboards

  dashboard_name               = each.key
  dashboard_group_id           = "dummy"
  dashboard_parameters         = module.converter[each.key].signalfx_dashboard
  signalfx_time_charts         = module.converter[each.key].signalfx_time_charts
  signalfx_single_value_charts = module.converter[each.key].signalfx_single_value_charts
  signalfx_list_charts         = module.converter[each.key].signalfx_list_charts
  signalfx_log_views           = module.converter[each.key].signalfx_log_views
  signalfx_table_charts        = module.converter[each.key].signalfx_table_charts
  signalfx_text_charts         = module.converter[each.key].signalfx_text_charts
}

output "dashboard" {
  value = module.dashboard
}
