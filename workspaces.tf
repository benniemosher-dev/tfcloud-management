resource "tfe_workspace" "workspaces" {
  for_each = { for space in local.workspaces : space.name => space }

  description           = try(each.value.description, null)
  execution_mode        = try(each.value.execution-mode, "remote")
  file_triggers_enabled = try(each.value.file-triggers-enabled, false)
  force_delete          = try(each.value.force-delete, false)
  name                  = each.value.name
  organization          = tfe_organization.organizations.name
  queue_all_runs        = try(each.value.queue-all-runs, false)
  # tag_names    = ["test", "app"]

  vcs_repo {
    identifier         = try(each.value.repo-name, "${var.config.org-name}/${each.value.name}")
    ingress_submodules = try(each.value.ingress-submodules, false)
    oauth_token_id     = try(each.value.oauth-token-id, tfe_oauth_client.github.oauth_token_id)
  }
}

resource "tfe_oauth_client" "github" {
  name             = "${var.config.org-name}-oauth-client"
  organization     = var.config.org-name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github-config.token
  service_provider = "github"
}

resource "tfe_workspace_variable_set" "workspace-variables" {
  for_each = { for wv in local.workspace-variables : "${wv.workspace-name}-${wv.variable-set-name}" => wv }

  variable_set_id = tfe_variable_set.variable-sets[each.value.variable-set-name].id
  workspace_id    = tfe_workspace.workspaces[each.value.workspace-name].id
}
