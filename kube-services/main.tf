data "digitalocean_kubernetes_cluster" "cluster" {
  name = "main-cluster"
}

# resource "kubernetes_persistent_volume_claim_v1" "do_block_storage_pvc" {
#   metadata {
#     name = "block-storage-pvc"
#     namespace = "grafana" // Won't exist
#   }
#   spec {
#     access_modes = ["ReadWriteOnce"]
#     resources {
#       requests = {
#         storage = "5Gi"
#       }
#     }
#     volume_name = "cluster-do-block-storage"
#     storage_class_name = "do-block-storage"
#   }
# }

resource "helm_release" "helm_grafana_release" {
  name             = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  version          = "6.30.1"
  namespace        = "grafana"
  create_namespace = true

  values = [<<EOF
persinstance:
  enabled: true
  existingClaim: "cluster-do-block-storage"
  subPath: /var/lib/grafana/dashboards
EOF
  ]
}
