output "ui_url" {
  value = "https://${module.ui_app.default_hostname}"
}

output "api_url" {
  value = "https://${module.api_app.default_hostname}"
}