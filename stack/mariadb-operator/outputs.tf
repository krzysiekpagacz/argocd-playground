output "mariadb_password" {
    value = random_password.mariadb_password.result
    sensitive = true
}