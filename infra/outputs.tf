output "resource_group_name" {
  description = "Name of the resource group."
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "Location of the resource group."
  value       = module.resource_group.location
}

output "vnet_id" {
  description = "ID of the virtual network."
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "ID of the subnet used by the VM."
  value       = module.network.subnet_id
}

output "nsg_id" {
  description = "ID of the network security group."
  value       = module.security.nsg_id
}

output "vm_id" {
  description = "ID of the Windows VM."
  value       = module.windows_vm.vm_id
}

output "vm_name" {
  description = "Name of the Windows VM."
  value       = module.windows_vm.vm_name
}

output "vm_private_ip" {
  description = "Private IP address of the Windows VM."
  value       = module.windows_vm.private_ip_address
}

output "vm_public_ip" {
  description = "Public IP address of the Windows VM (if enabled)."
  value       = module.windows_vm.public_ip_address
}

output "key_vault_id" {
  description = "ID of the Key Vault used for secrets."
  value       = module.key_vault.id
}

output "key_vault_uri" {
  description = "URI of the Key Vault used for secrets."
  value       = module.key_vault.vault_uri
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace."
  value       = module.monitoring.log_analytics_workspace_id
}

output "managed_identity_principal_id" {
  description = "Principal ID of the user-assigned managed identity attached to the VM."
  value       = module.identity.principal_id
}
