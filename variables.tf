variable "dashboard_name" {
  type        = string
  description = "The name of the dashboard."
}

variable "dashboard_parameters" {
  type        = any
  description = "Map of parameters to set on the dashboard. Key is the parameter name, value is the parameter value."
  default     = {}
}

variable "dashboard_group_parameters" {
  type        = any
  description = "Map of parameters to set on the dashboard group. Key is the parameter name, value is the parameter value."
  default     = {}
}

variable "create_dashboard_group" {
  type        = bool
  description = "Whether to create a dashboard group to add the dashboard to."
  default     = false
}

variable "dashboard_group_id" {
  type        = string
  description = "The id of an existing dashboard group to add charts."
  default     = null
}

variable "signalfx_time_charts" {
  type        = any
  description = "Map of time charts to create. Key is an id, value is chart config."
  default     = {}
}

variable "signalfx_list_charts" {
  type        = any
  description = "Map of list charts to create. Key is an id, value is chart config."
  default     = {}
}

variable "signalfx_log_views" {
  type        = any
  description = "Map of list charts to create. Key is an id, value is chart config."
  default     = {}
}

variable "signalfx_table_charts" {
  type        = any
  description = "Map of table charts to create. Key is an id, value is chart config."
  default     = {}
}

variable "signalfx_single_value_charts" {
  type        = any
  description = "Map of single value charts to create. Key is an id, value is chart config."
  default     = {}
}
