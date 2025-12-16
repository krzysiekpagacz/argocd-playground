locals {
  mariadb_config = yamldecode(file("${path.module}/../../configuration/mariadb.yaml"))
}

resource "helm_release" "mariadb_operator" {
  for_each          = local.mariadb_config

  chart             = "${path.module}/../../apps/mariadb-operator"
  description       = "Deploys MariaDB helm chart within the cluster as an ArgoCD Application"

  name              = each.key
  namespace         = each.value.namespace
  dependency_update = true
  create_namespace  = true

  values = [
    yamlencode({
      targetRevision = each.value.target_revision
    })
  ]
}
