data "azurerm_key_vault" "this" {
  name                = split("/", var.key_vault_id)[length(split("/", var.key_vault_id)) - 1]
  resource_group_name = var.resource_group_name
}

# NOTE: We intentionally do NOT read the secret value in Terraform to avoid
# storing it in state. The secret must be created out-of-band (e.g., via
# Azure CLI, portal, or pipeline) and will be referenced by the VM at runtime
# using its managed identity.

resource "azurerm_public_ip" "this" {
  count               = var.enable_public_ip ? 1 : 0
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enable_public_ip ? azurerm_public_ip.this[0].id : null
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_windows_virtual_machine" "this" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username

  # Admin password is not provided here to avoid storing it in state.
  # Use Key Vault + managed identity + custom script / DSC to set or rotate
  # credentials post-provisioning.
  admin_password = "DummyPassword!ChangeImmediately1" # placeholder; rotate immediately via automation

  network_interface_ids = [azurerm_network_interface.this.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.managed_identity_id]
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  tags = var.tags
}

# Example extension to bootstrap secret retrieval (script should use MSI to get secret)
resource "azurerm_virtual_machine_extension" "kv_bootstrap" {
  name                 = "kv-bootstrap"
  virtual_machine_id   = azurerm_windows_virtual_machine.this.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    commandToExecute = "powershell -ExecutionPolicy Bypass -File C:/kv-bootstrap/bootstrap.ps1"
  })

  protected_settings = jsonencode({
    # No secrets here; script uses managed identity to access Key Vault.
  })

  depends_on = [azurerm_windows_virtual_machine.this]
}
