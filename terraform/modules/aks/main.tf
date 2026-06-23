#################################################
# USER ASSIGNED MANAGED IDENTITY
#################################################

resource "azurerm_user_assigned_identity" "this" {

  name                = "${var.cluster_name}-identity"

  location            = var.location

  resource_group_name = var.resource_group_name
}

#################################################
# AKS CLUSTER
#################################################

resource "azurerm_kubernetes_cluster" "this" {

  name                = var.cluster_name

  location            = var.location

  resource_group_name = var.resource_group_name

  dns_prefix          = var.cluster_name

  kubernetes_version  = var.kubernetes_version

  oidc_issuer_enabled       = true

  workload_identity_enabled = true

  automatic_upgrade_channel = "patch"

  sku_tier = "Standard"

  default_node_pool {

    name = "system"

    vm_size = var.vm_size

    node_count = var.node_count

    auto_scaling_enabled = true

    min_count = 2

    max_count = 10

    vnet_subnet_id = var.subnet_id

    only_critical_addons_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {

    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  network_profile {

    network_plugin = "azure"

    network_policy = "azure"

    load_balancer_sku = "standard"
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# ACR PULL PERMISSION
#################################################

resource "azurerm_role_assignment" "acr_pull" {

  scope = var.acr_id

  role_definition_name = "AcrPull"

  principal_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
