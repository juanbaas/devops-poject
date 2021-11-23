
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group = var.resource_group
  location            = var.location
}

module "public_ip" {
  source              = "./modules/public_ip"
  prefix              = var.prefix
  location            = var.location
  resource_group = var.resource_group
}

module "aks" {
  source = "./modules/aks"
  prefix = var.prefix
  location = var.location
  resource_group = var.resource_group
}