# Confluent Cloud Service Account management

Service account management for Confluent Cloud. Creates a service account, API Key and role bindings. API Key rotation is managed by a time\_rotating resource.

## Create a service account 

```hcl

locals {
    service_accounts = [
        "service-account-1",
        "service-account-2",
        "service-account-3",
    ]
}

module "create_service_accounts" {
  for_each = toset(local.service_accounts)
  source   = "github.com/mcolomerc/terraform-confluent-iam?ref=v1.0.2"
  providers = {
    confluent = confluent.confluent_cloud
  }
  environment     = var.environment
  service_account = {
    name = each.value
    description = "Service Account ${each.value}"
  }
}

```

## Create role bindings for service accounts

```hcl

// Create Service Accounts and role bindings
module "service_accounts" {
  for_each =   { for sa in local.service_accounts_map : sa.index => sa } 
  source   = "github.com/mcolomerc/terraform-confluent-iam?ref=v1.0.2"
  providers = {
    confluent = confluent.confluent_cloud
  }
  environment      = var.environment
  cluster_role_bindings = {
    service_account = each.value.service_account_name
    cluster         = each.value.cluster
    sa_role_bindings = each.value.sa_role_bindings
  }
  depends_on = [
    module.create_service_accounts,
    module.topics
  ] 
}
```



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >=1.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_rbac"></a> [cluster\_rbac](#module\_cluster\_rbac) | ./modules/cluster_rbac | n/a |
| <a name="module_environment_rbac"></a> [environment\_rbac](#module\_environment\_rbac) | ./modules/environment_rbac | n/a |
| <a name="module_idp_rbac"></a> [idp\_rbac](#module\_idp\_rbac) | ./modules/identity_pool_rbac | n/a |
| <a name="module_service_account"></a> [service\_account](#module\_service\_account) | ./modules/service_accounts | n/a |
| <a name="module_sr_rbac"></a> [sr\_rbac](#module\_sr\_rbac) | ./modules/sr_rbac | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_role_bindings"></a> [cluster\_role\_bindings](#input\_cluster\_role\_bindings) | n/a | <pre>object({<br>    service_account = string<br>    cluster         = string<br>    environment     = string<br>    sa_role_bindings = list(object({<br>      role     = string<br>      resource = optional(string)<br>      name     = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_environment_role_bindings"></a> [environment\_role\_bindings](#input\_environment\_role\_bindings) | n/a | <pre>object({<br>    service_account = string<br>    environment     = string<br>  })</pre> | `null` | no |
| <a name="input_identity_pool_role_bindings"></a> [identity\_pool\_role\_bindings](#input\_identity\_pool\_role\_bindings) | n/a | <pre>object({<br>    environment       = string<br>    cluster           = string<br>    identity_provider = string<br>    identity_pools = list(object({<br>      identity_pool = object({<br>        display_name   = string<br>        description    = optional(string)<br>        identity_claim = string<br>        filter         = string<br>      })<br>      roles = list(object({<br>        resource        = string<br>        resource_prefix = string<br>        role            = string<br>      }))<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_schema_registry_role_bindings"></a> [schema\_registry\_role\_bindings](#input\_schema\_registry\_role\_bindings) | n/a | <pre>object({<br>    service_account = string<br>    cluster         = string<br>    environment     = string<br>    sa_role_bindings = list(object({<br>      role     = string<br>      resource = optional(string)<br>      name     = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to manage | <pre>object({<br>    name        = string<br>    description = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service Account |
| <a name="output_service_account_kafka_api_key"></a> [service\_account\_kafka\_api\_key](#output\_service\_account\_kafka\_api\_key) | Service Account API/KEY |
| <a name="output_service_account_kafka_role_bindings"></a> [service\_account\_kafka\_role\_bindings](#output\_service\_account\_kafka\_role\_bindings) | Service Account Role Bindings |
<!-- END_TF_DOCS -->