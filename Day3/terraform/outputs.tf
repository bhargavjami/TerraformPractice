output "sql_server_name" {
  value = module.sql_server.server_name
}

output "sql_database_name" {
  value = module.sql_database.database_name
}

output "app_name" {
  value = module.app_service.app_name
}

output "app_principal_id" {
  value = module.app_service.app_principal_id
}