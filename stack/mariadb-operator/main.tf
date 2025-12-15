locals {
  mariadb_config = yamldecode(file("${path.module}/../../configuration/mariadb-operator.yaml"))
}

resource "helm_release" "mariadb_operator" {
  name       = local.mariadb_config["release_name"]
  chart      = "${path.module}/../../charts/mariadb-operator"
  namespace  = local.mariadb_config["namespace"]
  create_namespace = true
}

resource "kubernetes_manifest" "mariadb_instance" {
  manifest = {
    apiVersion = "mariadb.mmontes.io/v1alpha1"
    kind       = "MariaDB"
    metadata = {
      name      = "mariadb-instance"
      namespace = "default"
    }
    spec = {
      rootPasswordSecretKeyRef = {
        name = kubernetes_secret.mariadb_secret.metadata[0].name
        key  = "password"
      }
      image    = "mariadb:11.4"
      replicas = 1
      storage = {
        size = "1Gi"
      }
    }
  }
}

