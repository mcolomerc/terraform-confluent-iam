# Confluent Cloud Service Account management


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | =>1.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | =>1.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [confluent_api_key.service-account-kafka-api-key](https://registry.terraform.io/providers/confluentinc/confluent/>1.43.0/docs/resources/api_key) | resource |
| [confluent_role_binding.cluster_resource_rbac](https://registry.terraform.io/providers/confluentinc/confluent/>1.43.0/docs/resources/role_binding) | resource |
| [confluent_service_account.sa](https://registry.terraform.io/providers/confluentinc/confluent/>1.43.0/docs/resources/service_account) | resource |
| [confluent_environment.env](https://registry.terraform.io/providers/confluentinc/confluent/>1.43.0/docs/data-sources/environment) | data source |
| [confluent_kafka_cluster.cluster](https://registry.terraform.io/providers/confluentinc/confluent/>1.43.0/docs/data-sources/kafka_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_id"></a> [environment\_id](#input\_environment\_id) | Environment ID | `string` | n/a | yes |
| <a name="input_kafka_cluster_id"></a> [kafka\_cluster\_id](#input\_kafka\_cluster\_id) | Kafka cluster ID | `string` | n/a | yes |
| <a name="input_sa_role_bindings"></a> [sa\_role\_bindings](#input\_sa\_role\_bindings) | Service Account Role Bindings. List of: Role name (DeveloperRead, DeveloperWrite, ResourceOwner), resource: (topic, group or transactional-id), name: (name of the resource) | <pre>optional(list(object({<br>      role = string<br>      resource = string   <br>      name = string<br>    })))</pre> | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to manage | <pre>object({<br>        name = string<br>        description = string<br>    })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
| <a name="output_service_account_kafka_api_key"></a> [service\_account\_kafka\_api\_key](#output\_service\_account\_kafka\_api\_key) | n/a |
| <a name="output_service_account_kafka_role_bindings"></a> [service\_account\_kafka\_role\_bindings](#output\_service\_account\_kafka\_role\_bindings) | n/a |
<!-- END_TF_DOCS -->