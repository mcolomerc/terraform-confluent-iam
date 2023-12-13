// Service Account
output service_account {
    value = data.confluent_service_account.sa
}

// Service Account Role Bindings 
output service_account_kafka_role_bindings { 
  value = [
    confluent_role_binding.environment_admin
  ]
}
