terraform {
  backend "remote" {
    organization = "main-org"
    workspaces {
      name = "digitalocean-k8s-services"
    }
  }
}
