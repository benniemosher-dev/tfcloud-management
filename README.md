# tfcloud-management

![CI Terraform](https://github.com/benniemosher-dev/tfcloud-management/actions/workflows/ci-terraform.yml/badge.svg)

☁️ TF managing our TF Cloud organization. ☁️

## 📜 Usage:

### To retrieve secrets:

Reach out to [@benniemosher](https://keybase.io/benniemosher) on Keybase and get access to his secrets repo then:

```bash
git clone keybase://private/benniemosher/secrets
ln -s $HOME/Code/personal/secrets/tfcloud.auto.tfvars ./tfcloud.auto.tfvars
ln -s $HOME/Code/personal/secrets/cloudflare.auto.tfvars ./cloudflare.auto.tfvars
ln -s $HOME/Code/personal/secrets/github.auto.tfvars ./github.auto.tfvars
```

- To install dependencies needed run:
  ```bash
  brew bundle install
  ```
- To initialize Terraform in this folder:
  ```bash
  task infra:init
  ```
- To update modules and providers in this folder:
  ```bash
  task init -- -upgrade
  ```
- To validate the module in this folder:
  ```bash
  task infra:validate
  ```
- To plan the infrastructure in this folder:
  ```bash
  task infra:plan
  ```
- To plan specific resources of infrastructure in this folder:
  ```bash
  task infra:plan -- -target='cloudflare_record.this'
  ```
- To apply the infrastructure in this folder:
  ```bash
  task infra:apply
  ```
- To apply specific resources of infrastructure in this folder:
  ```bash
  task infra:apply -- -target='cloudflare_record.this'
  ```
- To destroy the infrastructure in this folder:
  ```bash
  task infra:destroy
  ```
- To destroy specific resources of infrastructure in this folder:
  ```bash
  task infra:destroy -- -target='cloudflare_record.this'
  ```

### 🆒 Extras:

- To find all the automation available in this folder:
  ```bash
  task --list-all
  ```
- To estimate the cost of the infrastructure in this folder:
  ```bash
  task infra:cost
  ```
- To update the documentation in this folder:
  ```bash
  task infra:docs
  ```
- To lint the Terraform in this folder:
  ```bash
  task infra:lint
  ```
- To validate security in this folder:
  ```bash
  task infra:sec
  ```

## 📋 Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.12.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_organization_secret.org-token](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret) | resource |
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/oauth_client) | resource |
| [tfe_organization.organizations](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization) | resource |
| [tfe_organization_token.org-token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization_token) | resource |
| [tfe_variable.variables](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.variable-sets](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.workspace-variables](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare-config"></a> [cloudflare-config](#input\_cloudflare-config) | The config to connect Terraform to Cloudflare | <pre>object({<br>    account-id = optional(string, null)<br>    api-token  = string<br>    cidrs      = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_config"></a> [config](#input\_config) | The config for your organization in TFCloud. | <pre>object({<br>    domain   = string<br>    org-name = string<br>  })</pre> | n/a | yes |
| <a name="input_github-config"></a> [github-config](#input\_github-config) | The config for connecting to Github. | <pre>object({<br>    token = string<br>  })</pre> | n/a | yes |
| <a name="input_tfcloud-config"></a> [tfcloud-config](#input\_tfcloud-config) | The config for connecting to TFCloud. | <pre>object({<br>    token = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
