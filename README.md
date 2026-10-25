# StrataForge

### Infrastructure Automation Platform

**Reproducible Infrastructure. Safer Deployments.**

StrataForge is a Terraform-based Infrastructure as Code (IaC) project that demonstrates modular configuration management, environment-specific settings, input validation, automated testing, and CI security checks.

It generates consistent application configuration files for development and production environments using Terraform's local provider, without requiring paid cloud resources.

## Features

- **Modular architecture:** Reusable Terraform module for application configuration.
- **Environment separation:** Independent development and production configurations.
- **Input validation:** Validates environment names, replica counts, CPU and memory settings, application ports, and health-check paths.
- **Dynamic configuration:** Uses `for_each` to manage multiple environments.
- **JSON generation:** Uses `jsonencode` to generate structured configuration files.
- **Terraform outputs:** Exposes configuration paths, application details, and deployment summaries.
- **Automated tests:** Uses Terraform's native test framework to check outputs, environments, and configuration values.
- **CI automation:** GitHub Actions runs formatting, initialization, validation, and Terraform tests.
- **Security scanning:** Integrates Checkov to identify potential Terraform security issues.

## Architecture

```text
StrataForge
├── Terraform Root Configuration
│   ├── Variables and Validation
│   ├── Environment Iteration
│   └── Outputs
├── Reusable App Configuration Module
│   ├── Development Configuration
│   └── Production Configuration
├── Generated JSON Files
├── Terraform Tests
└── GitHub Actions CI Workflow
```

## Development and Production

| Setting | Development | Production |
|---|---:|---:|
| Replicas | 2 | 3 |
| CPU limit value | 1 | 2 |
| Memory value | 512 MB | 1024 MB |
| Application port | 8080 | 8080 |
| Health-check path | `/health` | `/health` |

**Note:** CPU and memory values are configuration metadata in this project; they do not represent resources actually provisioned or enforced by a cloud platform.

## Tech Stack

- Terraform
- HCL
- JSON
- HashiCorp Local Provider
- Git and GitHub
- GitHub Actions
- Checkov

## Project Structure

```text
StrataForge/
├── .github/workflows/
│   └── terraform-checks.yml
├── environments/
│   ├── dev.tfvars
│   └── prod.tfvars
├── modules/
│   └── app-config/
│       └── main.tf
├── tests/
│   └── strataforge.tftest.hcl
├── .gitignore
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
└── README.md
```

## Prerequisites

- Terraform CLI 1.17.0, or a compatible version satisfying the project's version constraint
- Git
- PowerShell, Bash, or another terminal

## Getting Started

Clone the repository:

```bash
git clone https://github.com/ItsShreena/StrataForge.git
cd StrataForge
```

Initialize Terraform:

```bash
terraform init
```

Format and validate the configuration:

```bash
terraform fmt -recursive
terraform validate
```

Run automated tests:

```bash
terraform test
```

Preview changes:

```bash
terraform plan
```

Generate the development and production configuration files:

```bash
terraform apply
```

Review the proposed changes and type `yes` when prompted.

Inspect the outputs:

```bash
terraform output
terraform output deployment_summary
```

The generated files are `generated-dev-app-config.json` and `generated-prod-app-config.json`. They are local outputs and are excluded from Git tracking.

## Continuous Integration

The GitHub Actions workflow is designed to run on pushes to `main` and pull requests. It checks Terraform formatting, initializes the configuration, validates it, runs tests, and invokes Checkov.

Checkov is currently configured with `soft_fail: true`, so security findings may be reported without failing the workflow. Review findings rather than assuming that a successful workflow means every security check passed.

## Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code principles
- Terraform modules, variables, outputs, and `for_each`
- Input validation and environment-specific configuration
- Automated infrastructure configuration tests
- CI workflows and security scanning
- Git-based project versioning

## Limitations and Future Improvements

StrataForge currently generates local application configuration files. It does not provision cloud infrastructure or deploy an application.

Possible future extensions include cloud-provider modules, remote state management, secrets management, policy enforcement, and deployment integrations.

