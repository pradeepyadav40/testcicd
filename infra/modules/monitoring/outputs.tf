output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.name
}

output "diagnostic_storage_account_id" {
  description = "ID of the diagnostics storage account."
  value       = azurerm_storage_account.diagnostics.id
}

output "diagnostic_storage_account_name" {
  description = "Name of the diagnostics storage account."
  value       = azurerm_storage_account.diagnostics.name
}
