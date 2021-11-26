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

variable "enable_attach_acr" {
  description = "Enables Azure Container Registry attachment"
  type = string
}

variable "acr_id" {
  description = "ACR ID"
  type = string
}

variable "client_id" {
  description = "ARM Client ID"
  type = string
}

variable "client_secret" {
  description = "ARM Client secret"
  type = string
}