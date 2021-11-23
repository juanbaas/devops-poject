resource "helm_release" "nginx" {
  create_namespace = true
  name             = "nginx"
  repository       = "./deploy"
  namespace        = "nginx"
  chart            = "deploy"
}

resource "helm_release" "prometheus" {
  create_namespace = true
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "monitoring"
  chart            = "kube-prometheus-stack"
}