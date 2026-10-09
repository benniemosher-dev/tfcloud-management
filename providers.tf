terraform {
  required_version = "1.16.5"

  cloud {
    organization = "benniemosher-dev"
    workspaces {
      name = "tfcloud-management"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.13.0"
    }

    tfe = {
      version = "0.82.0"
    }
  }
}

provider "github" {
  token = var.github-config.token
  owner = var.config.org-name
}

provider "tfe" {
  token = var.tfcloud-config.token
}
