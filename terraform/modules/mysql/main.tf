resource "azurerm_mysql_flexible_server" "this" {

  name                   = var.server_name

  resource_group_name    = var.resource_group_name

  location               = var.location

  administrator_login    = var.admin_username

  administrator_password = var.admin_password

  sku_name               = var.sku_name

  version                = "8.0.21"

  backup_retention_days  = 7

  zone                   = "1"

  delegated_subnet_id    = var.subnet_id

  private_dns_zone_id    = var.private_dns_zone_id

  high_availability {
    mode = "ZoneRedundant"
  }

  storage {
    size_gb = 100
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

##################################################
# DATABASE
##################################################

resource "azurerm_mysql_flexible_database" "this" {

  name      = var.database_name

  server_name = azurerm_mysql_flexible_server.this.name

  resource_group_name = var.resource_group_name

  charset   = "utf8mb4"

  collation = "utf8mb4_unicode_ci"
}
