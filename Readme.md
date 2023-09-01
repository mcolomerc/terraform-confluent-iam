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

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | >=1.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_rbac"></a> [cluster\_rbac](#module\_cluster\_rbac) | ./modules/cluster_rbac | n/a |

## Resources

| Name | Type |
|------|------|
| [confluent_service_account.sa](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/service_account) | resource |
| [confluent_environment.main](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/environment) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_role_bindings"></a> [cluster\_role\_bindings](#input\_cluster\_role\_bindings) | n/a | <pre>object({ <br>    service_account = string<br>    cluster = string<br>    sa_role_bindings = list(object({<br>      role     = string<br>      resource = optional(string)<br>      name     = optional(string)<br>    })) <br>  })</pre> | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment ID | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to manage | <pre>object({<br>        name = string<br>        description = string<br>    })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service Account |
| <a name="output_service_account_kafka_api_key"></a> [service\_account\_kafka\_api\_key](#output\_service\_account\_kafka\_api\_key) | Service Account API/KEY |
| <a name="output_service_account_kafka_role_bindings"></a> [service\_account\_kafka\_role\_bindings](#output\_service\_account\_kafka\_role\_bindings) | Service Account Role Bindings |
<!-- END_TF_DOCS -->