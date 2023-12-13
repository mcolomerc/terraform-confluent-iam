
data "confluent_environment" "main" {
  id = var.environment
}

resource "confluent_service_account" "sa" { 
  display_name = var.service_account.name
  description  = var.service_account.description
} 

module "environment_rbac" {
  source = "./modules/environment_rbac"
  service_account = confluent_service_account.sa.display_name
  environment = data.confluent_environment.main.id

  depends_on = [ confluent_service_account.sa ]
}

module "cluster_rbac" {
  source = "./modules/cluster_rbac"
  count = var.cluster_role_bindings != null ? 1 : 0
  service_account = var.cluster_role_bindings.service_account
  cluster = var.cluster_role_bindings.cluster
  sa_role_bindings = var.cluster_role_bindings.sa_role_bindings
  environment = data.confluent_environment.main.id
} 
module "sr_rbac" {
  source = "./modules/sr_rbac"
  cluster = var.schema_registry_role_bindings.cluster
  environment = var.schema_registry_role_bindings.environment
  service_account = var.schema_registry_role_bindings.service_account
  sa_role_bindings = var.schema_registry_role_bindings.sa_role_bindings

  depends_on = [ confluent_service_account.sa ]
}