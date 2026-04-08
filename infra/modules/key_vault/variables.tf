variable "resource_group_name" {
  description = "Name of the resource group in which to create the Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault to create. Must be globally unique."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID for the Key Vault tenant."
  type        = string
}

variable "managed_identity_principal_id" {
  description = "Principal ID of the user-assigned managed identity that should have access to secrets."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Key Vault."
  type        = map(string)
  default     = {}
}
