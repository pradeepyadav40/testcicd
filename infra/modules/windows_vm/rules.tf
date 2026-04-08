# Windows VM module rules:
# - No real admin passwords are stored in Terraform code or state.
# - VM uses a user-assigned managed identity for Key Vault and Azure resource access.
# - Public IP is optional and should be disabled in production unless required.
