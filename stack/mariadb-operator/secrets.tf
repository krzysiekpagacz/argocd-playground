# resource "random_password" "mariadb_password" {
#   length           = 16
#   special          = true
#   override_special = "!@#$%^&*"
# }

# # it creates admin password
# resource "kubernetes_secret_v1" "mariadb_root" {
#   for_each = local.mariadb_config

#   metadata {
#     name      = "mariadb"
#     namespace = each.value.namespace
#     labels = {
#       "app.kubernetes.io/name" = each.key
#     }
#   }

#   type = "Opaque"
#   data = {
#     root-password = random_password.mariadb_password.result
#   }

#   depends_on = [kubernetes_namespace_v1.ns]

# }
