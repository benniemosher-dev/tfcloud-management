
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
    },
    {
      description    = "The config for connecting to TFCloud."
      name           = "tfcloud"
      sensitive      = true
      variable-value = jsonencode(var.tfcloud-config)
    }
  ]

  workspaces = [
    {
      name        = "benniemosher-com-infra"
      description = "🏗 Infrastructure to support the benniemosher.com domain concept. 🏗"
      variable-sets = [
        "cloudflare"
      ]
    },
    {
      name        = "github-management"
      description = "🥋 Infrastructure managing our Github organization. 🥋"
      variable-sets = [
        "github"
      ]
    },
    {
      name        = "tfcloud-management"
      description = "☁️ TF managing our TF Cloud organization. ☁️"
      variable-sets = [
        "cloudflare",
        "github",
        "tfcloud",
      ]
    }
  ]

  workspace-variables = flatten([for space in local.workspaces : [for vs in space.variable-sets : {
    variable-set-name = vs
    workspace-name    = space.name
  }]])
}