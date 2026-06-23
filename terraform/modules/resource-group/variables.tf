variable "name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "genio"
}
