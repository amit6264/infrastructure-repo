output "apim_id" {
  value = azurerm_api_management.this.id
}

output "gateway_url" {
  value = azurerm_api_management.this.gateway_url
}

output "management_api_url" {
  value = azurerm_api_management.this.management_api_url
}

output "developer_portal_url" {
  value = azurerm_api_management.this.developer_portal_url
}

output "principal_id" {
  value = azurerm_api_management.this.identity[0].principal_id
}
