variable "prefix" {
  description = "A prefix used for all resources"
  default     = "team7"
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned"
  default     = "EastUS"
  type        = string
}

/*
variable "node_count" {
  description = "Number of nodes for the Kubernetes cluster"
  default     = 1
  type        = number
}

variable "vm_size" {
  description = "VM size for each node"
  default     = "Standard_DS2_v2"
  type        = string
}

variable "os_disk_size_gb" {
  description = "VM disk size in Gb"
  default     = 40
  type        = number
}
*/
variable "resource_group" {
  description = "Resource Group Name"
  default     = "team7"
  type        = string
}