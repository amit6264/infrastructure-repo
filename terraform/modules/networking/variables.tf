variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "prefix" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "aks_subnet_cidr" {
  type = string
}

variable "database_subnet_cidr" {
  type = string
}

variable "private_endpoint_subnet_cidr" {
  type = string
}
