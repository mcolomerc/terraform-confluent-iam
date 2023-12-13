variable "environment" {
  type        = string
  description = "Environment id"
}

variable "cluster" {
  type        = string
  description = "Confluent cloud Kafka Cluster ID"
}

variable "identity_provider" {
  type        = string
  description = "Identity provider Id"
}

variable "identity_pools" {
  type = list(object({
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
}

