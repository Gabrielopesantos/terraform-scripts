data "digitalocean_kubernetes_versions" "versions_data" {
  version_prefix = "1.22."
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name         = "main-cluster"
  region       = "lon1"
  version      = data.digitalocean_kubernetes_versions.versions_data.latest_version
  auto_upgrade = true

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 2
    tags        = ["worker"]
  }

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }
}
