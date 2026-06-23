variable "apim_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "publisher_name" {
  type = string
}

variable "publisher_email" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "Developer_1"
}

variable "environment" {
  type    = string
  default = "prod"
}
