data "digitalocean_kubernetes_cluster" "cluster" {
  name = "main-cluster"
}

resource "kubernetes_persistent_volume_v1" "digital_ocean_main_volume" {
  metadata {
    name = "digital-ocean-pv"
  }

  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "dobs.csi.digitalocean.com"
        volume_handle = "do:volume:613aadd3-f1af-11ec-b135-0a58ac14c292" // Is this sensitive?
        fs_type       = "ext4"
      }
    }
    storage_class_name = "do-block-storage"
  }
}

resource "kubernetes_persistent_volume_claim_v1" "digital_ocean_main_volume_pvc" {
  metadata {
    name      = "digital-ocean-pvc"
    namespace = "grafana"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name        = kubernetes_persistent_volume_v1.digital_ocean_main_volume.metadata.0.name
    storage_class_name = "do-block-storage"
  }
}

#resource "helm_release" "helm_grafana_release" {
#name             = "grafana"
#repository       = "https://grafana.github.io/helm-charts"
#chart            = "grafana"
#version          = "6.30.1"
#namespace        = "grafana"
#create_namespace = true

#values = [<<EOF
#persinstance:
#enabled: true
#existingClaim: "cluster-do-block-storage"
#subPath: /var/lib/grafana/dashboards
#EOF
#]
#}
