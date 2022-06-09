terraform {
  backend "remote" {
    organization = "main-org"
    workspaces {
      name = "init-iam"
    }
  }
}