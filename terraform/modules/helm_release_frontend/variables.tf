variable "repository" {
  description = "Path or URL to repository for chart image"
  type = string
}

variable "namespace" {
  description = "Namespace for k8s cluster"
  type = string
}