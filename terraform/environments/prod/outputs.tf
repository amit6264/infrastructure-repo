output "acr_login_server" {
  value = module.acr.login_server
}

output "shared_auth_db_fqdn" {
  value = module.shared_auth_db.sql_server_fqdn
}

output "eu_aks_name" {
  value = module.eu_aks.cluster_name
}

output "asia_aks_name" {
  value = module.asia_aks.cluster_name
}

output "middleeast_aks_name" {
  value = module.me_aks.cluster_name
}

output "apim_gateway_url" {
  value = module.apim.gateway_url
}

output "static_web_app_url" {
  value = module.static_web_app.url
}
