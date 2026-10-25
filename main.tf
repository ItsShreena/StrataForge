
module "app_config" {
  for_each = {
    dev  = 2
    prod = 3
  }

  source = "./modules/app-config"

  application_name = var.application_name
  environment      = each.key
  replicas         = each.value
}
