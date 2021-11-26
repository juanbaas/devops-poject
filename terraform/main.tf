
module "resource_group" {
  source         = "./modules/resource_group"
  resource_group = var.resource_group
  location       = var.location
}

module "acr" {
  source         = "./modules/container_registry"
  prefix         = var.prefix
  location       = var.location
  resource_group = var.resource_group
  admin_enabled  = true

  depends_on = [module.resource_group]
}

module "aks" {
  source         = "./modules/aks"
  prefix         = var.prefix
  location       = var.location
  resource_group = var.resource_group

  client_id     = var.client_id
  client_secret = var.client_secret

  enable_attach_acr = true
  acr_id            = module.acr.id

  depends_on = [module.resource_group]
}

resource "local_file" "kubeconfig" {
  depends_on = [module.aks]
  filename   = "kubeconfig"
  content    = module.aks.kube_config
}


module "helm_prometheus" {
  source     = "./modules/helm_release_prometheus"
  namespace  = "monitoring"
  repository = var.repository_prometheus
}

module "helm_frontend" {
  source     = "./modules/helm_release_frontend"
  namespace  = "frontend"
  repository = var.repository_frontend
}

module "load_balancer" {
  source               = "./modules/load_balancer"
  public_ip_address_id = module.public_ip.id
  location             = var.location
  prefix               = var.prefix
  resource_group       = var.resource_group

  depends_on = [module.resource_group]
}

module "public_ip" {
  source         = "./modules/public_ip"
  prefix         = var.prefix
  location       = var.location
  resource_group = var.resource_group

  depends_on = [module.resource_group]
}

