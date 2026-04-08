variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "vm_name" {
  description = "Name of the Windows VM."
  type        = string
}

variable "vm_size" {
  description = "Size of the Windows VM."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Windows VM."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the VM NIC will be placed."
  type        = string
}

variable "enable_public_ip" {
  description = "Whether to create a public IP for the VM."
  type        = bool
  default     = false
}

variable "network_security_group_id" {
  description = "ID of the NSG to associate with the VM NIC."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace for monitoring."
  type        = string
}

variable "managed_identity_id" {
  description = "ID of the user-assigned managed identity to attach to the VM."
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault that stores the VM admin password and other secrets."
  type        = string
}

variable "admin_password_secret_name" {
  description = "Name of the Key Vault secret that stores the VM admin password."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VM and related resources."
  type        = map(string)
  default     = {}
}
