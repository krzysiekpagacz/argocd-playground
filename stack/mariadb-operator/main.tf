locals {
  mariadb_config = yamldecode(file("${path.module}/../../configuration/mariadb.yaml"))
}

resource "helm_release" "mariadb_operator" {
  for_each = local.mariadb_config

  chart       = "${path.module}/../../apps/parent-app"
  description = "Deploys MariaDB helm chart within the cluster as an ArgoCD Application"

  name              = each.key
  namespace         = each.value.namespace
  dependency_update = true
  create_namespace  = true

  # depends_on = [kubernetes_secret_v1.admin_password]

  values = [
    yamlencode({
      databaseName   = each.key
      projectName    = each.value.project_name
      targetRevision = each.value.target_revision
      namespace      = each.value.namespace
      cluster = {
        clusterName = each.key
        replicas       = try(each.value.cluster.replicas, 3)
        galeraEnabled  = try(each.value.cluster.galera.enabled, false)
        metricsEnabled = try(each.value.metrics.enabled, false)
        tlsEnabled     = try(each.value.tls.enabled, false) #ToDo(kp): make default to true before merge
      }
    })
  ]
}
