terraform {
  required_version = ">= 1.5.0"
}

module "windows_vm_stack" {
  source = "../.."

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  location            = var.location
  environment         = var.environment
  resource_group_name = var.resource_group_name

  vm_admin_username = var.vm_admin_username
  vm_size           = var.vm_size
  vm_name           = var.vm_name

  address_space = var.address_space
  subnet_prefix = var.subnet_prefix

  enable_public_ip = var.enable_public_ip

  key_vault_name                  = var.key_vault_name
  vm_admin_password_secret_name   = var.vm_admin_password_secret_name
  log_analytics_workspace_name    = var.log_analytics_workspace_name
  diagnostic_storage_account_name = var.diagnostic_storage_account_name

  tags = var.tags
}
