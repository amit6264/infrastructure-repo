resource "azurerm_mssql_server" "this" {

  name                = var.server_name

  resource_group_name = var.resource_group_name

  location            = var.location

  version             = "12.0"

  administrator_login          = var.admin_username

  administrator_login_password = var.admin_password

  minimum_tls_version = "1.2"

  public_network_access_enabled = true

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_mssql_database" "this" {

  name      = var.database_name

  server_id = azurerm_mssql_server.this.id

  sku_name  = var.sku_name

  zone_redundant = true

  storage_account_type = "Local"
}
