
# Confluent 

service_account = {
  name        = "mcolomer-sa-tf"
  description = "Service account for Terraform"
}

roles = [
  {
    reource = "environment"
    name    = "Marcelo"
    role    = "EnvironmentAdmin"
  }
]

 
cluster_rbac = [
  {
    environment = "env-zmz2zd"
    cluster     = "lkc-v7omw0" 
    sa_role_bindings = [
      {
        role     = "DeveloperRead"
        resource = "topic"
        name     = "pageviews_en"
      }
    ]
  }
]

schemaregistry_rbac = [
  {
    environment = "env-zmz2zd"
    cluster     = "lsrc-nvmj2d" 
    sa_role_bindings = [
      {
        role     = "DeveloperRead"
        resource = "subject"
        name     = "pageviews_en"
      }
    ]
  }
]



