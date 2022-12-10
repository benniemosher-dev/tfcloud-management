resource "tfe_variable_set" "variable-sets" {
  for_each = { for varset in local.variable-sets : varset.name => varset }

  description  = try(each.value.description, null)
  name         = each.value.name
  organization = tfe_organization.organizations.name
}

resource "tfe_variable" "variables" {
  for_each = { for varset in local.variable-sets : varset.name => varset }

  category        = try(each.value.category, "terraform")
  description     = try(each.value.description, null)
  hcl             = try(each.value.hcl, true)
  key             = "${each.value.name}-config"
  sensitive       = try(each.value.sensitive, false)
  value           = each.value.variable-value
  variable_set_id = tfe_variable_set.variable-sets[each.key].id
}

locals {
  variable-sets = [
    {
      description    = "The config for connecting to Cloudflare."
      name           = "cloudflare"
      sensitive      = true
      variable-value = jsonencode(var.cloudflare-config)
    },
    {
      description    = "The config for connecting to Github."
      name           = "github"
      sensitive      = true
      variable-value = jsonencode(var.github-config)
    }
  ]
}
