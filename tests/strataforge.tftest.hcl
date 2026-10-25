
run "verify_dev_resource_settings" {
  command = plan

  assert {
    condition = (
      module.app_config["dev"].replica_count == 2 &&
      module.app_config["dev"].cpu_limit == 1 &&
      module.app_config["dev"].memory_limit_mb == 512
    )
    error_message = "Dev must use 2 replicas, CPU limit 1, and 512 MB memory."
  }
}

run "verify_prod_resource_settings" {
  command = plan

  assert {
    condition = (
      module.app_config["prod"].replica_count == 3 &&
      module.app_config["prod"].cpu_limit == 2 &&
      module.app_config["prod"].memory_limit_mb == 1024
    )
    error_message = "Prod must use 3 replicas, CPU limit 2, and 1024 MB memory."
  }
}
