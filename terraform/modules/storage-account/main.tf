resource "azurerm_storage_account" "this" {

  name                     = var.storage_account_name

  resource_group_name      = var.resource_group_name

  location                 = var.location

  account_tier             = "Standard"

  account_replication_type = "GRS"

  min_tls_version          = "TLS1_2"

  public_network_access_enabled = false

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# IMAGES CONTAINER
#################################################

resource "azurerm_storage_container" "images" {

  name                  = "images"

  storage_account_id    = azurerm_storage_account.this.id

  container_access_type = "private"
}

#################################################
# DOCUMENTS CONTAINER
#################################################

resource "azurerm_storage_container" "documents" {

  name                  = "documents"

  storage_account_id    = azurerm_storage_account.this.id

  container_access_type = "private"
}

#################################################
# REPORTS CONTAINER
#################################################

resource "azurerm_storage_container" "reports" {

  name                  = "reports"

  storage_account_id    = azurerm_storage_account.this.id

  container_access_type = "private"
}
