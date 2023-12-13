 
data "confluent_service_account" "sa" {
  display_name = var.service_account
}
data "confluent_schema_registry_cluster" "sr" {
  id = var.cluster
  environment {
    id = var.environment
  }
}

 resource "confluent_role_binding" "subject-rb" {
  for_each   = {
    for index, rbac in var.sa_role_bindings:
    rbac.name => rbac  
  }
  principal   = "User:${data.confluent_service_account.sa.display_name}"
  role_name   = each.value.role
  crn_pattern = "${data.confluent_schema_registry_cluster.sr.resource_name}/subject=${each.value.name}"
}