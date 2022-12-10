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
