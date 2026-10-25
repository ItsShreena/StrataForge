
module "app_config" {
  for_each = {
    dev  = 2
    prod = 3
  }

  source = "./modules/app-config"

  application_name = var.application_name
  environment      = each.key
  replicas         = each.value

  cpu_limit = each.key == "prod" ? 2 : 1

  memory_limit_mb = each.key == "prod" ? 1024 : 512

  application_port = 8080

  health_check_path = "/health"
}
