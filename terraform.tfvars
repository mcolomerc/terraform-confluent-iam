# # Confluent 
# service_account = {
#   name        = "ogomez-sa-mapfre-tf"
#   description = "Service account for Terraform"
# }

# cluster_role_bindings = {
#    service_account = "CC-WEBINAR"
#     environment = "ogomez"
#     cluster     = "cluster_0"
#     sa_role_bindings = [
#       {
#         role     = "DeveloperRead"
#         resource = "topic"
#         name     = "pageviews_en"
#       }
#     ]
#   }


# schema_registry_role_bindings = {
#     service_account = "CC-WEBINAR"
#     environment = "ogomez"
#     cluster     = "lsrc-3r8pdj"
#     sa_role_bindings = [
#       {
#         role     = "DeveloperRead"
#         resource = "subject"
#         name     = "pageviews_en"
#       }
#     ]
#   }


identity_pool_role_bindings = {
  environment       = "ogomez"
  cluster           = "cluster_0"
  identity_provider = "op-q0G"
  identity_pools = [
    {
      identity_pool = {
        display_name   = "mapfre_adm"
        description    = "mapfre ADM Pool"
        identity_claim = "claims.sub"
        filter         = "claims.aud=='1326f8fe-6d30-456b-a34c-93f13cac0da1'"
      }
      roles = [
        {
          role            = "ResourceOwner"
          resource        = "topic"
          resource_prefix = "pageviews_en*"
        },
        {
          role            = "ResourceOwner"
          resource        = "group"
          resource_prefix = "pageviews_en*"
        }
      ]
    }
  ]
}




