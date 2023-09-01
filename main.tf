
data "confluent_environment" "main" {
  id = var.environment
}

resource "confluent_service_account" "sa" { 
  count = var.service_account != null ? 1 : 0
  display_name = var.service_account.name
  description  = var.service_account.description
} 

module "cluster_rbac" {
  source = "./modules/cluster_rbac"
  count = var.cluster_role_bindings != null ? 1 : 0
  service_account = var.cluster_role_bindings.service_account
  cluster = var.cluster_role_bindings.cluster
  sa_role_bindings = var.cluster_role_bindings.sa_role_bindings
  environment = data.confluent_environment.main.id
} 

 

 
 

/* WIP
module "sr_rbac" {
  for_each = {
    for index, cluster in var.schemaregistry_rbac:
    rbac.cluster => rbac  
  }
  source = "./modules/sr_rbac"
  schema_registry_cluster_id = each.value.cluster
  environment = each.value.environment
  service_account = confluent_service_account.sa
  sa_role_bindings = each.value.sa_role_bindings
}
*/