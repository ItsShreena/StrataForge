variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "replicas" {
  description = "Desired number of application instances"
  type        = number
}

resource "local_file" "app_config" {
  filename = "${path.root}/generated-${var.environment}-app-config.json"

  content = jsonencode({
    application = var.application_name
    environment = var.environment
    replicas    = var.replicas
  })
}

output "config_file_path" {
  description = "Path of the generated application configuration"
  value       = local_file.app_config.filename
}
