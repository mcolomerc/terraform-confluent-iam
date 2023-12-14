variable service_account {
    type = string 
} 

variable cluster {
    type = string
    description = "Schema Registry cluster id"
}

variable environment {
    type = string
    description = "Environment display name"
} 

variable sa_role_bindings {
    type = list(object({
      role = string
      resource = optional(string)   
      name = optional(string)
    }))
    default = []
    description = "Service Account Role Bindings. List of: Role name (DeveloperRead, DeveloperWrite, ResourceOwner), resource: (topic, group or transactional-id), name: (name of the resource)"
}