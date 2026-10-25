
output "application_name" {
  description = "Name of the configured application"
  value       = var.application_name
}

output "config_file_paths" {
  description = "Paths of the generated application configurations"
  value = {
    for environment, config in module.app_config :
    environment => config.config_file_path
  }
}

output "deployment_summary" {
  description = "Summary of configuration settings for each environment"
  value = {
    for environment, config in module.app_config :
    environment => {
      config_file_path = config.config_file_path
    }
  }
}
