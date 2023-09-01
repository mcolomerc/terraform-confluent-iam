
// Create the service account 
resource "confluent_service_account" "sa" { 
  display_name = var.service_account.name
  description  = var.service_account.description
} 