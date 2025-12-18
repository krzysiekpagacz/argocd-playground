locals {
  namespaces_set = toset([for _, config in local.mariadb_config : config.namespace])
}

resource "kubernetes_namespace_v1" "ns" {
  for_each = local.namespaces_set

  metadata {
    name = each.key
  }
}
