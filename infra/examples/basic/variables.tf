variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-winvm-eastus-example"
}

variable "vm_admin_username" {
  description = "Admin username for the Windows VM."
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
  default     = "vm-win-eastus-example"
}

variable "address_space" {
  description = "Address space for the VNet."
  type        = list(string)
  default     = ["10.30.0.0/16"]
}

variable "subnet_prefix" {
  description = "Subnet prefix."
  type        = string
  default     = "10.30.1.0/24"
}

variable "enable_public_ip" {
  description = "Whether to create a public IP for the VM."
  type        = bool
  default     = true
}

variable "key_vault_name" {
  description = "Name of the Key Vault."
  type        = string
  default     = "kv-winvm-eastus-example"
}

variable "vm_admin_password_secret_name" {
  description = "Name of the Key Vault secret for the VM admin password."
  type        = string
  default     = "vm-admin-password"
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
  default     = "law-winvm-eastus-example"
}

variable "diagnostic_storage_account_name" {
  description = "Name of the diagnostics storage account."
  type        = string
  default     = "stwinvmdiagexample001"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default = {
    project     = "windows-vm-single"
    environment = "dev"
  }
}
