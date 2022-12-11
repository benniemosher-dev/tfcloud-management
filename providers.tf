terraform {
  required_version = "~> 1.3"

  cloud {
    organization = "benniemosher-dev"
    workspaces {
      name = "tfcloud-management"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    tfe = {
      version = "~> 0.38"
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
