variable "subscription_id" {
  description = "Azure subscription ID where resources will be deployed."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, test, prod)."
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the resource group to create for this stack."
  type        = string
  default     = "rg-windows-vm-eastus-001"
}

variable "tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    project     = "windows-vm-single"
    owner       = "platform-team"
    cost_center = "it-ops"
  }
}

variable "vm_admin_username" {
  description = "Admin username for the Windows VM. Password is stored in Key Vault, not here."
  type        = string
  default     = "localadmin"
}

variable "vm_size" {
  description = "Size of the Windows VM."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "vm_name" {
  description = "Name of the Windows VM."
  type        = string
  default     = "vm-win-eastus-001"
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_prefix" {
  description = "Address prefix for the subnet."
  type        = string
  default     = "10.10.1.0/24"
}

variable "enable_public_ip" {
  description = "Whether to create a public IP for the VM."
  type        = bool
  default     = true
}

variable "key_vault_name" {
  description = "Name of the Key Vault to create for secrets."
  type        = string
  default     = "kv-winvm-eastus-001"
}

variable "vm_admin_password_secret_name" {
  description = "Name of the Key Vault secret that stores the VM admin password."
  type        = string
  default     = "vm-admin-password"
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace for monitoring."
  type        = string
  default     = "law-winvm-eastus-001"
}

variable "diagnostic_storage_account_name" {
  description = "Name of the storage account for diagnostics logs. Must be globally unique."
  type        = string
  default     = "stwinvmdiageastus001"
}
