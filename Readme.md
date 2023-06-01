# Confluent Cloud Service Account management


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >= 1.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | >= 1.43.0 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [confluent_api_key.service-account-kafka-api-key](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/api_key) | resource |
| [confluent_role_binding.cluster_resource_rbac](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/role_binding) | resource |
| [confluent_service_account.sa](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/service_account) | resource |
| [time_rotating.rotate](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [time_static.rotate](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static) | resource |
| [confluent_environment.main](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/environment) | data source |
| [confluent_kafka_cluster.cluster](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/kafka_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_rotate_days"></a> [api\_key\_rotate\_days](#input\_api\_key\_rotate\_days) | API Key rotation days. Uses time\_rotating resource to trigger API Key rotation | `number` | `30` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Kafka cluster ID | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment ID | `string` | n/a | yes |
| <a name="input_sa_role_bindings"></a> [sa\_role\_bindings](#input\_sa\_role\_bindings) | Service Account Role Bindings. List of: Role name (DeveloperRead, DeveloperWrite, ResourceOwner), resource: (topic, group or transactional-id), name: (name of the resource) | <pre>list(object({<br>      role = string<br>      resource = string   <br>      name = string<br>    }))</pre> | `[]` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to manage | <pre>object({<br>        name = string<br>        description = string<br>    })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
| <a name="output_service_account_kafka_api_key"></a> [service\_account\_kafka\_api\_key](#output\_service\_account\_kafka\_api\_key) | n/a |
| <a name="output_service_account_kafka_role_bindings"></a> [service\_account\_kafka\_role\_bindings](#output\_service\_account\_kafka\_role\_bindings) | n/a |
<!-- END_TF_DOCS -->