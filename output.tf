// Service Account
output service_account {
    value = confluent_service_account.sa
}

// Service Account API/KEY
output service_account_kafka_api_key {
    value = confluent_api_key.service-account-kafka-api-key
    sensitive = true
}
// Service Account Role Bindings 
output service_account_kafka_role_bindings { 
  value = [
    for rbac in confluent_role_binding.cluster_resource_rbac : rbac
  ]
}
