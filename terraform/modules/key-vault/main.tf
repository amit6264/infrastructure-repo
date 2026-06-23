resource "azurerm_key_vault" "this" {

  name                = var.kv_name

  location            = var.location

  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id

  sku_name  = "standard"

  soft_delete_retention_days = 90

  purge_protection_enabled = true

  public_network_access_enabled = true

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# AUTH DB PASSWORD
#################################################

resource "azurerm_key_vault_secret" "sql_password" {

  name         = "sql-admin-password"

  value        = var.sql_admin_password

  key_vault_id = azurerm_key_vault.this.id
}

#################################################
# JWT SECRET
#################################################

resource "random_password" "jwt_secret" {

  length  = 64

  special = true
}

resource "azurerm_key_vault_secret" "jwt_secret" {

  name         = "jwt-secret"

  value        = random_password.jwt_secret.result

  key_vault_id = azurerm_key_vault.this.id
}
