
variable environment {
    type = string
    description = "Environment ID"
} 

variable service_account {
    type = object({
        name = string
        description = string
    })
    description = "Service account to manage"
    default = null
}  
 
variable "cluster_role_bindings" {
  type = object({ 
    service_account = string
    cluster = string
    sa_role_bindings = list(object({
      role     = string
      resource = optional(string)
      name     = optional(string)
    })) 
  })
  default = null
} 



 
 