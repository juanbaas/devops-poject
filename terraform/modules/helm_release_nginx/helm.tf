resource "helm_release" "nginx" {
  create_namespace = true
  name             = "nginx"
  repository       = "${var.repository}"
  namespace        = "${var.namespace}"
  chart            = "deploy"
}