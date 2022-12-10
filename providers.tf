terraform {
  required_version = "~> 1.3"

  # cloud {
  #   organization = "benniemosher-dev"
  #   workspaces {
  #     # TODO: Change this to match the workspace name
  #     name = "terraform-domain-concept"
  #   }
  # }

  required_providers {
    tfe = {
      version = "~> 0.38"
    }
  }
}

provider "tfe" {
  token = var.tfcloud-config.token
}
