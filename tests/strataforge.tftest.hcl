run "verify_application_name" {
  command = plan

  assert {
    condition     = output.application_name == "StrataForge"
    error_message = "The application name should be StrataForge."
  }
}

run "verify_both_environments" {
  command = plan

  assert {
    condition = (
      contains(keys(output.config_file_paths), "dev") &&
      contains(keys(output.config_file_paths), "prod")
    )
    error_message = "Both dev and prod configuration paths must be present."
  }
}

run "reject_invalid_environment" {
  command = plan

  variables {
    environment = "staging"
  }

  expect_failures = [
    var.environment
  ]
}

run "reject_invalid_replica_count" {
  command = plan

  variables {
    replicas = 0
  }

  expect_failures = [
    var.replicas
  ]
}
