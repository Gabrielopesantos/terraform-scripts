data "digitalocean_kubernetes_cluster" "cluster" {
  name = "main-cluster" # Hard coded
}

resource "helm_release" "helm_grafana_release" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.29.7"

  #values = [
  #"${file("values.yaml")}"
  #]

  #set {
  #name  = "cluster.enabled"
  #value = "true"
  #}

  #set {
  #name  = "metrics.enabled"
  #value = "true"
  #}

  #set {
  #name  = "service.annotations.prometheus\\.io/port"
  #value = "9127"
  #type  = "string"
  #}
}
