module "service_account" {
  source          = "./modules/service_accounts"
  count           = var.service_account != null ? 1 : 0
  service_account = var.service_account
}
module "environment_rbac" {
  source          = "./modules/environment_rbac"
  count           = var.environment_role_bindings != null ? 1 : 0
  service_account = var.environment_role_bindings.service_account
  environment     = var.environment_role_bindings.environment
}

module "cluster_rbac" {
  source           = "./modules/cluster_rbac"
  count            = var.cluster_role_bindings != null ? 1 : 0
  service_account  = var.cluster_role_bindings.service_account
  cluster          = var.cluster_role_bindings.cluster
  environment      = var.cluster_role_bindings.environment
  sa_role_bindings = var.cluster_role_bindings.sa_role_bindings
}

module "sr_rbac" {
  source           = "./modules/sr_rbac"
  count            = var.schema_registry_role_bindings != null ? 1 : 0
  cluster          = var.schema_registry_role_bindings.cluster
  environment      = var.schema_registry_role_bindings.environment
  service_account  = var.schema_registry_role_bindings.service_account
  sa_role_bindings = var.schema_registry_role_bindings.sa_role_bindings
}

module "idp_rbac" {
  source            = "./modules/identity_pool_rbac"
  count             = var.identity_pool_role_bindings != null ? 1 : 0
  environment       = var.identity_pool_role_bindings.environment
  cluster           = var.identity_pool_role_bindings.cluster
  identity_provider = var.identity_pool_role_bindings.identity_provider
  identity_pools    = var.identity_pool_role_bindings.identity_pools
}
