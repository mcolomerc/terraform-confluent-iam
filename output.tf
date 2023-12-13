// Service Account
output service_account {
    value = confluent_service_account
}

// Service Account API/KEY
output service_account_kafka_api_key {
  value = length(module.cluster_rbac) > 0 ? module.cluster_rbac[0].service_account_kafka_api_key : null 
  sensitive = true
}
// Service Account Role Bindings 
output service_account_kafka_role_bindings { 
  value = length(module.cluster_rbac) > 0 ? module.cluster_rbac[0].service_account_kafka_role_bindings : null 
}
