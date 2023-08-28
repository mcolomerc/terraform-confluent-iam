 

data "confluent_schema_registry_cluster" "sr" {
  id = var.schema_registry_cluster_id
  environment {
    id = var.environment.id
  }
}

 resource "confluent_role_binding" "subject-rb" {
  for_each   = {
    for index, rbac in var.sa_role_bindings:
    rbac.name => rbac  
  }
  principal   = "User:${var.service_account.id}"
  role_name   = each.value.role
  crn_pattern = "${confluent_schema_registry_cluster.sr.resource_name}/subject=abc*"
}