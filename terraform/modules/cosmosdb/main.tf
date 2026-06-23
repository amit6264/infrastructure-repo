resource "azurerm_cosmosdb_account" "this" {

  name                = var.account_name

  location            = var.location

  resource_group_name = var.resource_group_name

  offer_type = "Standard"

  kind = "GlobalDocumentDB"

  automatic_failover_enabled = false

  public_network_access_enabled = false

  consistency_policy {

    consistency_level = "Session"
  }

  geo_location {

    location          = var.location

    failover_priority = 0
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# DATABASE
#################################################

resource "azurerm_cosmosdb_sql_database" "this" {

  name                = var.database_name

  resource_group_name = var.resource_group_name

  account_name        = azurerm_cosmosdb_account.this.name
}
