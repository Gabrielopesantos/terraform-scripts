terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
