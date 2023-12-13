 
data "confluent_environment" "environment" {
  id = var.environment
}

data "confluent_service_account" "sa" {
  display_name  = var.service_account
} 

resource "confluent_role_binding" "environment_admin" { 
  principal   = "User:${data.confluent_service_account.sa.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = "${data.confluent_environment.environment.resource_name}"
}
