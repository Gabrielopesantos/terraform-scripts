terraform {
  backend "remote" {
    organization = "main-org"
    workspaces {
      name = "digitalocean-cluster"
    }
  }
}
