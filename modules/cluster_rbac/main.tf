 
data "confluent_environment" "environment" {
  display_name = var.environment
}

data "confluent_kafka_cluster" "cluster" {
  display_name = var.cluster
  environment {
   id = data.confluent_environment.environment.id
  }
}

data "confluent_service_account" "sa" {
  display_name  = var.service_account
} 

resource "time_rotating" "rotate" { 
  rotation_days = var.api_key_rotate_days 
}

resource "time_static" "rotate" {
  rfc3339 = time_rotating.rotate.rfc3339
} 

resource "confluent_api_key" "service-account-kafka-api-key" {
  display_name = "${var.service_account}-kafka-api-key"
  description  = "Kafka API Key that is owned by ${var.service_account} service account"
  owner {
    id          = data.confluent_service_account.sa.id
    api_version = data.confluent_service_account.sa.api_version
    kind        = data.confluent_service_account.sa.kind
  }

  managed_resource {
    id          = data.confluent_kafka_cluster.cluster.id
    api_version = data.confluent_kafka_cluster.cluster.api_version
    kind        = data.confluent_kafka_cluster.cluster.kind

    environment {
      id = data.confluent_environment.environment.id
    }
  }
  lifecycle {
    replace_triggered_by = [ 
        time_static.rotate
    ]
    create_before_destroy = true
  }
}  

resource "confluent_role_binding" "cluster_admin" { 
  for_each   = {
    for index, rbac in var.sa_role_bindings:
    rbac.name => rbac if rbac.role == "CloudClusterAdmin" 
  }
  principal   = "User:${data.confluent_service_account.sa.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = "${data.confluent_kafka_cluster.cluster.rbac_crn}"
}

resource "confluent_role_binding" "cluster_resource_rbac" { 
  for_each   = {
    for index, rbac in var.sa_role_bindings:
    rbac.name => rbac  if rbac.role != "CloudClusterAdmin"
  }
  principal   = "User:${data.confluent_service_account.sa.id}"
  role_name   = each.value.role
  crn_pattern = "${data.confluent_kafka_cluster.cluster.rbac_crn}/kafka=${data.confluent_kafka_cluster.cluster.id}/${each.value.resource}=${each.value.name}"
}
