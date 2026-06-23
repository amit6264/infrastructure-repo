variable "server_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "subnet_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "GP_Standard_D4ds_v5"
}

variable "environment" {
  type    = string
  default = "prod"
}
