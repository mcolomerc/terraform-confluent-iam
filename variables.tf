
# Confluent Cloud Credentials  
variable "confluent_cloud_api_key" {
  type = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type = string
   description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable service_account {
    type = object({
        name = string
        description = string
    })
    description = "Service account to manage"
} 

variable api_key_rotate_days {
    type = number
    default = 30
    description = "API Key rotation days. Uses time_rotating resource to trigger API Key rotation"
}

variable cluster {
    type = string
    description = "Kafka cluster ID"
}

variable environment {
    type = string
    description = "Environment ID"
} 

variable sa_role_bindings {
    type = list(object({
      role = string
      resource = string   
      name = string
    }))
    default = []
    description = "Service Account Role Bindings. List of: Role name (DeveloperRead, DeveloperWrite, ResourceOwner), resource: (topic, group or transactional-id), name: (name of the resource)"
}
 
 