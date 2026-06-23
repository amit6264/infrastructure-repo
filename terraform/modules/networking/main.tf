resource "azurerm_virtual_network" "this" {

  name                = "${var.prefix}-vnet"

  location            = var.location

  resource_group_name = var.resource_group_name

  address_space       = [var.vnet_cidr]
}

#################################################
# AKS SUBNET
#################################################

resource "azurerm_subnet" "aks" {

  name                 = "aks-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes     = [var.aks_subnet_cidr]
}

#################################################
# DATABASE SUBNET
#################################################

resource "azurerm_subnet" "database" {

  name                 = "database-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes     = [var.database_subnet_cidr]

  delegation {
    name = "mysql"

    service_delegation {

      name = "Microsoft.DBforMySQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

#################################################
# PRIVATE ENDPOINT SUBNET
#################################################

resource "azurerm_subnet" "private_endpoint" {

  name                 = "private-endpoint-subnet"

  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes     = [var.private_endpoint_subnet_cidr]
}

#################################################
# MYSQL PRIVATE DNS ZONE
#################################################

resource "azurerm_private_dns_zone" "mysql" {

  name                = "privatelink.mysql.database.azure.com"

  resource_group_name = var.resource_group_name
}

#################################################
# DNS LINK TO VNET
#################################################

resource "azurerm_private_dns_zone_virtual_network_link" "mysql" {

  name = "${var.prefix}-mysql-link"

  resource_group_name = var.resource_group_name

  private_dns_zone_name = azurerm_private_dns_zone.mysql.name

  virtual_network_id = azurerm_virtual_network.this.id

  registration_enabled = false
}
