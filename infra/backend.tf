terraform {
  backend "azurerm" {
    # Identity-based authentication (no secrets). The following are placeholders
    # and should be provided via environment variables or partial backend config
    # at init time (e.g. -backend-config).
    #
    # Example backend-config values:
    #   resource_group_name  = "rg-tfstate-eastus-001"
    #   storage_account_name = "sttfstateeastus001"
    #   container_name       = "tfstate"
    #   key                  = "windows-vm/terraform.tfstate"
    #
    # Authentication will use Azure CLI / Managed Identity / Workload Identity.
  }
}
