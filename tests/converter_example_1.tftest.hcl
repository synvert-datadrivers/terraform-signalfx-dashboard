variables {
  dashboard_group_id = "dummy-id"
}

run "setup" {
  command = apply
  variables {
    dashboard_file_path = "examples/default-dashboard-export/dashboard_Intro to Splunk Observability Cloud.json"
  }
  # Create the input for the dashboard.

  module {
    source = "synvert-datadrivers/dashboard-converter/signalfx"
  }
}

provider "signalfx" {
  auth_token = "dummy"
}

run "validate_output_dashboard" {
  variables {
    dashboard_name               = run.setup.signalfx_dashboard.name
    dashboard_parameters         = run.setup.signalfx_dashboard
    signalfx_time_charts         = run.setup.signalfx_time_charts
    signalfx_single_value_charts = run.setup.signalfx_single_value_charts
    signalfx_list_charts         = run.setup.signalfx_list_charts
    signalfx_log_views           = run.setup.signalfx_log_views
    signalfx_table_charts        = run.setup.signalfx_table_charts
    signalfx_text_charts         = run.setup.signalfx_text_charts
  }

  command = plan

  assert {
    condition     = signalfx_dashboard.this.name == run.setup.signalfx_dashboard.name
    error_message = "dashboard id does not match expected output"
  }

  assert {
    condition     = output.signalfx_dashboard_group == { id = "dummy-id" }
    error_message = "dashboard group id does not match expected output"
  }

  assert {
    condition     = output.signalfx_dashboard.dashboard_group == "dummy-id"
    error_message = "dashboard group id does not match expected output"
  }

  assert {
    condition     = output.signalfx_dashboard.name == run.setup.signalfx_dashboard.name
    error_message = "dashboard group id does not match expected output"
  }

  assert {
    condition     = keys(output.signalfx_charts) == ["EpSGwz_AIAA", "EpSGxbaAIAA", "EpSGxovAIAA", "EpSGyJgAAAA"]
    error_message = "charts id does not match expected output"
  }
}

