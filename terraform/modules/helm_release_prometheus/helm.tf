resource "helm_release" "prometheus" {
  create_namespace = true
  name             = "prometheus"
  repository       = "${var.repository}"
  namespace        = "${var.namespace}"
  chart            = "kube-prometheus-stack"
}