# StrataForge
### Reproducible Infrastructure. Safer Deployments.

StrataForge is a Terraform-based infrastructure automation project that demonstrates modular infrastructure configuration, environment separation, input validation, reusable modules, and automated checks with GitHub Actions.

The project currently uses Terraform's **local provider** to generate development and production application configuration files. It runs locally without requiring an AWS account or paid cloud resources.

## Features

- **Multi-environment configuration:** Generate separate development and production configurations.
- **Reusable Terraform module:** Keep application configuration logic inside `modules/app-config`.
- **Infrastructure as Code:** Define desired configurations declaratively using HCL.
- **Input validation:** Validate supported environment names and replica-count limits.
- **Structured outputs:** Display the generated configuration file paths.
- **CI validation:** Run Terraform formatting, initialization, and validation checks through GitHub Actions.
- **Cost-free local execution:** Experiment without provisioning cloud infrastructure.

## Architecture

```text
StrataForge/
├── .github/
│   └── workflows/
│       └── terraform-checks.yml
├── environments/
│   ├── dev.tfvars
│   └── prod.tfvars
├── modules/
│   └── app-config/
│       └── main.tf
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars.example
└── .gitignore
```

## How it works

1. Terraform loads the root configuration.
2. The root module calls the reusable `app-config` module for both environments.
3. The module generates a JSON configuration file for each environment.
4. Terraform outputs the resulting file paths.
5. GitHub Actions checks formatting and configuration validity on pushes to `main` and pull requests.

Expected generated files:

- `generated-dev-app-config.json`
- `generated-prod-app-config.json`

These generated files and Terraform state files are excluded from Git through `.gitignore`.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) 1.5.0 or newer
- [Git](https://git-scm.com/downloads)
- PowerShell, Command Prompt, or a terminal

## Getting started

Clone the repository:

```bash
git clone https://github.com/ItsShreena/StrataForge.git
cd StrataForge
```

Initialize Terraform:

```bash
terraform init
```

Check formatting and validate the configuration:

```bash
terraform fmt -check -recursive
terraform validate
```

Preview the changes:

```bash
terraform plan
```

Generate both environment configurations:

```bash
terraform apply
```

Review the plan and type `yes` when Terraform asks for approval.

Inspect the generated files:

```bash
Get-Content .\generated-dev-app-config.json
Get-Content .\generated-prod-app-config.json
```

View Terraform outputs:

```bash
terraform output
```

## Example configuration

Development:

```json
{
  "application": "StrataForge",
  "environment": "dev",
  "replicas": 2
}
```

Production:

```json
{
  "application": "StrataForge",
  "environment": "prod",
  "replicas": 3
}
```

## CI/CD

The GitHub Actions workflow in `.github/workflows/terraform-checks.yml` runs:

- Terraform formatting checks
- Terraform initialization without configuring a backend
- Terraform validation

This provides an automated baseline for detecting formatting and configuration errors before changes are merged.

## Technology stack

- **Infrastructure as Code:** Terraform, HCL
- **Provider:** HashiCorp Local
- **Automation:** GitHub Actions, YAML
- **Version control:** Git and GitHub
- **Configuration format:** JSON

## Roadmap

- Add reusable environment-specific configuration patterns.
- Introduce automated testing for Terraform modules.
- Explore cloud-provider modules with cost-conscious deployment options.
- Add security scanning and infrastructure policy checks.
- Expand CI workflows with plan review and deployment safeguards.
---

*StrataForge is an educational infrastructure automation project. Its current implementation generates local configuration files; it does not provision production cloud infrastructure.*