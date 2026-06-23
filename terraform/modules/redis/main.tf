resource "azurerm_redis_cache" "this" {

  name                = var.redis_name

  location            = var.location

  resource_group_name = var.resource_group_name

  capacity = var.capacity

  family   = var.family

  sku_name = var.sku_name

  minimum_tls_version = "1.2"

  public_network_access_enabled = false

  redis_configuration {
    maxmemory_reserved = 50
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
