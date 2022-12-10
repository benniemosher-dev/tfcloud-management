variable "config" {
  description = "The config for your organization in TFCloud."
  type = object({
    domain   = string
    org-name = string
  })
}

variable "cloudflare-config" {
  description = "The config to connect Terraform to Cloudflare"
  type = object({
    account-id = optional(string, null)
    api-token  = string
    cidrs      = list(string)
  })
}

variable "github-config" {
  description = "The config for connecting to Github."
  type = object({
    token = string
  })
}

variable "tfcloud-config" {
  description = "The config for connecting to TFCloud."
  type = object({
    token = string
  })
}
