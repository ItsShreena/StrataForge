
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

variable "cpu_limit" {
  description = "CPU limit per application instance"
  type        = number
}

variable "memory_limit_mb" {
  description = "Memory limit in MB per application instance"
  type        = number
}

variable "application_port" {
  description = "Application listening port"
  type        = number
}

variable "health_check_path" {
  description = "Application health-check endpoint"
  type        = string
}

resource "local_file" "app_config" {
  filename = "${path.root}/generated-${var.environment}-app-config.json"

  content = jsonencode({
    application = var.application_name
    environment = var.environment
    replicas    = var.replicas

    resources = {
      cpu_limit       = var.cpu_limit
      memory_limit_mb = var.memory_limit_mb
    }

    networking = {
      application_port = var.application_port
    }

    health_check = {
      path = var.health_check_path
    }
  })
}

output "config_file_path" {
  description = "Path of the generated application configuration"
  value       = local_file.app_config.filename
}
