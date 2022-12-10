terraform {
  required_version = "~> 1.3"

  cloud {
    organization = "benniemosher-dev"
    workspaces {
      name = "tfcloud-management"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.38"
    }
  }
}

provider "tfe" {
  token = var.tfcloud-config.token
}
