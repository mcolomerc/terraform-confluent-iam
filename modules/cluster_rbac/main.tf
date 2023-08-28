 
data "confluent_kafka_cluster" "cluster" {
  id = var.cluster
  environment {
    id = var.environment.id
  }
}

resource "confluent_role_binding" "cluster_resource_rbac" { 
  for_each   = {
    for index, rbac in var.sa_role_bindings:
    rbac.name => rbac  
  }
  principal   = "User:${confluent_service_account.sa.id}"
  role_name   = each.value.role
  crn_pattern = "${data.confluent_kafka_cluster.cluster.rbac_crn}/kafka=${data.confluent_kafka_cluster.cluster.id}/${each.value.resource}=${each.value.name}"
}
