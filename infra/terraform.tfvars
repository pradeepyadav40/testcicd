# Example tfvars for the Windows VM stack in East US

subscription_id = "00000000-0000-0000-0000-000000000000" # replace
tenant_id       = "00000000-0000-0000-0000-000000000000" # replace

location            = "eastus"
environment         = "dev"
resource_group_name = "rg-winvm-eastus-dev-001"

vm_admin_username = "localadmin"
vm_size           = "Standard_D2s_v5"
vm_name           = "vm-win-eastus-dev-001"

address_space  = ["10.20.0.0/16"]
subnet_prefix  = "10.20.1.0/24"

enable_public_ip = true

key_vault_name                    = "kv-winvm-eastus-dev-001"
vm_admin_password_secret_name     = "vm-admin-password"
log_analytics_workspace_name      = "law-winvm-eastus-dev-001"
diagnostic_storage_account_name   = "stwinvmdiageastusdev001"

tags = {
  project     = "windows-vm-single"
  owner       = "platform-team"
  environment = "dev"
}
