module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vnet_name      = "vnet-winvm-eastus-001"
  address_space  = var.address_space
  subnet_name    = "snet-winvm-app-001"
  subnet_prefix  = var.subnet_prefix

  tags = var.tags
}

module "security" {
  source = "./modules/security"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  nsg_name = "nsg-winvm-001"

  subnet_id = module.network.subnet_id

  allow_rdp_from_internet = true
  allowed_rdp_source_ips  = ["0.0.0.0/0"]

  tags = var.tags
}

module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  log_analytics_workspace_name    = var.log_analytics_workspace_name
  diagnostic_storage_account_name = var.diagnostic_storage_account_name

  tags = var.tags
}

module "identity" {
  source = "./modules/identity"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  managed_identity_name = "id-winvm-001"

  tags = var.tags
}

module "key_vault" {
  source = "./modules/key_vault"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  key_vault_name = var.key_vault_name

  tenant_id = var.tenant_id

  # Grant access to the VM's managed identity for secret get/list
  managed_identity_principal_id = module.identity.principal_id

  tags = var.tags
}

module "windows_vm" {
  source = "./modules/windows_vm"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vm_name = var.vm_name
  vm_size = var.vm_size

  admin_username = var.vm_admin_username

  subnet_id = module.network.subnet_id

  enable_public_ip = var.enable_public_ip

  network_security_group_id = module.security.nsg_id

  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id

  managed_identity_id = module.identity.id

  key_vault_id                  = module.key_vault.id
  admin_password_secret_name    = var.vm_admin_password_secret_name

  tags = var.tags
}
