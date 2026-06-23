variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "europe_location" {
  type = string
}

variable "asia_location" {
  type = string
}

variable "middleeast_location" {
  type = string
}

variable "sql_admin_username" {
  type = string
}

variable "sql_admin_password" {
  sensitive = true
}

variable "mysql_admin_username" {
  type = string
}

variable "mysql_admin_password" {
  sensitive = true
}

variable "aks_node_count" {
  type = number
}
