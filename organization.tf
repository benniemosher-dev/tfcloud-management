resource "tfe_organization" "organizations" {
  name                     = var.config.org-name
  email                    = "tfcloud@${var.config.domain}"
  collaborator_auth_policy = "two_factor_mandatory"
  cost_estimation_enabled  = true

  # TODO: Remove this when provider is not broken
  lifecycle {
    ignore_changes = [
      cost_estimation_enabled
    ]
  }
}

resource "tfe_organization_token" "org-token" {
  organization = tfe_organization.organizations.id
}

resource "tfe_team" "owners" {
  name         = "owners"
  organization = var.config.org-name
}

resource "tfe_team_token" "owners" {
  team_id = tfe_team.owners.id
}

resource "github_actions_organization_secret" "org-token" {
  secret_name     = "TF_API_TOKEN"
  visibility      = "all"
  plaintext_value = tfe_team_token.owners.token
}
