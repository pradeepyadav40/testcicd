output "vm_id" {
  description = "ID of the Windows VM."
  value       = azurerm_windows_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the Windows VM."
  value       = azurerm_windows_virtual_machine.this.name
}

output "private_ip_address" {
  description = "Private IP address of the Windows VM."
  value       = azurerm_network_interface.this.private_ip_address
}

output "public_ip_address" {
  description = "Public IP address of the Windows VM (if enabled)."
  value       = var.enable_public_ip && length(azurerm_public_ip.this) > 0 ? azurerm_public_ip.this[0].ip_address : null
}
