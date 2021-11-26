resource "helm_release" "frontend" {
  create_namespace = true
  name             = "frontend"
  repository       = "${var.repository}"
  namespace        = "${var.namespace}"
  chart            = "deploy"
}