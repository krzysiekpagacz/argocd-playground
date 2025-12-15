resource "random_password" "mariadb_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*"
}

resource "kubernetes_secret" "mariadb_secret" {
  metadata {
    name      = "mariadb"
    namespace = "default"
  }

  data = {
    password = random_password.mariadb_password.result
  }
}