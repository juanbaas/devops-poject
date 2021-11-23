variable "prefix" {
  description = "A prefix used for all resources"
  type = string
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned"
  type = string
}

variable "resource_group" {
  description = "Resource Group Name"
  type = string
}