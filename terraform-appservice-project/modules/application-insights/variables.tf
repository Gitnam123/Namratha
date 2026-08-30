variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "application_insights_name" {
  description = "Name of Application Insights"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of Log Analytics Workspace"
  type        = string
}
variable "log_analytics_location" {
  description = "Azure region for Log Analytics Workspace"
  type        = string
}