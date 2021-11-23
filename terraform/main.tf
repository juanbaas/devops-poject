
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group = var.resource_group
  location            = var.location
}

module "aks" {
  source = "./modules/aks"
  prefix = var.prefix
  location = var.location
  resource_group = var.resource_group
}

module "helm" {
  source                 = "./modules/helm"
}

module "load_balancer" {
  source               = "./modules/load_balancer"
  public_ip_address_id = module.public_ip.id
  location             = var.location
  prefix               = var.prefix
  resource_group  = var.resource_group
}

module "public_ip" {
  source              = "./modules/public_ip"
  prefix              = var.prefix
  location            = var.location
  resource_group = var.resource_group
}