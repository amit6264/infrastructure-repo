################################################
# RESOURCE GROUPS
################################################

module "global_rg" {
  source = "../../modules/resource-group"

  name     = "${var.project_name}-global-rg"
  location = var.europe_location
}

module "europe_rg" {
  source = "../../modules/resource-group"

  name     = "${var.project_name}-eu-rg"
  location = var.europe_location
}

module "asia_rg" {
  source = "../../modules/resource-group"

  name     = "${var.project_name}-asia-rg"
  location = var.asia_location
}

module "middleeast_rg" {
  source = "../../modules/resource-group"

  name     = "${var.project_name}-me-rg"
  location = var.middleeast_location
}

################################################
# GLOBAL SERVICES
################################################

module "acr" {
  source = "../../modules/acr"

  resource_group_name = module.global_rg.name
  location            = var.europe_location

  acr_name = "${var.project_name}acr"
}

module "keyvault" {
  source = "../../modules/key-vault"

  resource_group_name = module.global_rg.name
  location            = var.europe_location

  kv_name = "${var.project_name}-kv"
}

module "shared_auth_db" {
  source = "../../modules/sql-auth-db"

  resource_group_name = module.global_rg.name
  location            = var.europe_location

  admin_username = var.sql_admin_username
  admin_password = var.sql_admin_password
}

module "apim" {
  source = "../../modules/api-management"

  resource_group_name = module.global_rg.name
  location            = var.europe_location
}

module "static_web_app" {
  source = "../../modules/static-web-app"

  resource_group_name = module.global_rg.name
  location            = var.europe_location
}

################################################
# EUROPE
################################################

module "eu_network" {
  source = "../../modules/networking"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_mysql" {
  source = "../../modules/mysql"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_cosmos" {
  source = "../../modules/cosmosdb"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_redis" {
  source = "../../modules/redis"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_storage" {
  source = "../../modules/storage-account"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_appinsights" {
  source = "../../modules/app-insights"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location
}

module "eu_aks" {
  source = "../../modules/aks"

  resource_group_name = module.europe_rg.name
  location            = var.europe_location

  acr_id = module.acr.acr_id
}

################################################
# ASIA
################################################

module "asia_network" {
  source = "../../modules/networking"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_mysql" {
  source = "../../modules/mysql"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_cosmos" {
  source = "../../modules/cosmosdb"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_redis" {
  source = "../../modules/redis"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_storage" {
  source = "../../modules/storage-account"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_appinsights" {
  source = "../../modules/app-insights"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location
}

module "asia_aks" {
  source = "../../modules/aks"

  resource_group_name = module.asia_rg.name
  location            = var.asia_location

  acr_id = module.acr.acr_id
}

################################################
# MIDDLE EAST
################################################

module "me_network" {
  source = "../../modules/networking"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_mysql" {
  source = "../../modules/mysql"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_cosmos" {
  source = "../../modules/cosmosdb"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_redis" {
  source = "../../modules/redis"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_storage" {
  source = "../../modules/storage-account"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_appinsights" {
  source = "../../modules/app-insights"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location
}

module "me_aks" {
  source = "../../modules/aks"

  resource_group_name = module.middleeast_rg.name
  location            = var.middleeast_location

  acr_id = module.acr.acr_id
}
