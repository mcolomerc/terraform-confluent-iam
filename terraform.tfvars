
# Confluent 
environment = "env-zmz2zd"

cluster = "lkc-v7omw0"

service_account = {
  name        = "mcolomer-sa-tf"
  description = "Service account for Terraform"
} 

sa_role_bindings = [
  {
    role     = "DeveloperRead"
    resource = "topic"
    name     = "pageviews_en"
  },
  {
    role     = "DeveloperWrite"
    name     = "topic-from-cfk"
    resource = "topic"
  },
  {
    role     = "ResourceOwner"
    name     = "topic1"
    resource = "topic"
  },
  {
    role     = "DeveloperWrite"
    name     = "confluent_cli_consumer_*"
    resource = "group"
  },
  {
    role     = "DeveloperWrite"
    name     = "my-transctional-id"
    resource = "transactional-id"
  },
  {
    role     = "DeveloperRead"
    name     = "connector_name"
    resource = "connector"
  } 
]
    
