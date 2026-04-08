# Architecture Overview

This stack deploys a single Windows Virtual Machine in Azure (East US by default) using a modular Terraform architecture.

## Components

- Resource Group
- Virtual Network and Subnet
- Network Security Group (NSG)
- User-assigned Managed Identity
- Azure Key Vault (for secrets, no secrets in Terraform)
- Log Analytics Workspace and Diagnostics Storage Account
- Windows Virtual Machine with optional Public IP

## Security & Compliance

- Identity-based authentication for the Terraform backend (no storage keys in code).
- Secrets stored in Azure Key Vault; Terraform does not read or store secret values.
- VM uses a user-assigned managed identity for secure access to Key Vault and other Azure resources.
