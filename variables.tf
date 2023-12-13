
variable "service_account" {
  type = object({
    name        = string
    description = string
  })
  description = "Service account to manage"
  default     = null
}

variable "environment_role_bindings" {
  type = object({
    service_account = string
    environment     = string
  })
  default = null
}

variable "cluster_role_bindings" {
  type = object({
    service_account = string
    cluster         = string
    environment     = string
    sa_role_bindings = list(object({
      role     = string
      resource = optional(string)
      name     = optional(string)
    }))
  })
  default = null
}

variable "schema_registry_role_bindings" {
  type = object({
    service_account = string
    cluster         = string
    environment     = string
    sa_role_bindings = list(object({
      role     = string
      resource = optional(string)
      name     = optional(string)
    }))
  })
  default = null
}

variable "identity_pool_role_bindings" {
  type = object({
    environment       = string
    cluster           = string
    identity_provider = string
    identity_pools = list(object({
      identity_pool = object({
        display_name   = string
        description    = optional(string)
        identity_claim = string
        filter         = string
      })
      roles = list(object({
        resource        = string
        resource_prefix = string
        role            = string
      }))
    }))
  })
  default = null
}


