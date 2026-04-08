# Windows VM Module Compliance

- Deploys a single Windows Server VM with managed identity.
- Avoids storing secrets in Terraform by delegating password management to Key Vault and post-provisioning automation.
- Supports integration with Log Analytics via the provided workspace ID.
