# resource "random_password" "admin_password" {
#   length           = 16
#   special          = true
#   override_special = "!@#$%^&*"
# }

# # it creates admin password
# resource "kubernetes_secret_v1" "admin_password" {
#   for_each = local.mariadb_config

#   metadata {
#     name      = "admin-password"
#     namespace = each.value.namespace
#     labels = {
#       "app.kubernetes.io/name" = each.key
#     }
#   }

#   type = "Opaque"
#   data = {
#     password = random_password.mariadb_password.result
#   }

#   depends_on = [kubernetes_namespace_v1.ns]

# }
