# StrataForge — Infrastructure Automation Platform

**Reproducible Infrastructure. Safer Deployments.**

StrataForge is a Terraform-based Infrastructure as Code (IaC) project designed to demonstrate reusable modules, environment-specific configuration, input validation, and automated infrastructure checks.

The project currently uses Terraform's local provider to generate application configuration files without provisioning paid cloud resources.

## Features

- **Infrastructure as Code:** Define configuration using Terraform and HCL.
- **Reusable Modules:** Encapsulate application configuration in a dedicated module.
- **Environment Separation:** Maintain independent development and production settings.
- **Input Validation:** Restrict environment names and replica counts.
- **Terraform Outputs:** Expose useful configuration details.
- **CI Automation:** Run formatting and validation checks through GitHub Actions.
- **Cost-conscious Development:** Start locally without deploying paid cloud infrastructure.

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
├── .gitignore
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
└── terraform.tfvars.example
```

## Prerequisites

- Terraform CLI
- Git
- Visual Studio Code (recommended)

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

## Environment Configurations

Generate the development configuration:

```bash
terraform plan -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/dev.tfvars"
```

Generate the production-style configuration:

```bash
terraform plan -var-file="environments/prod.tfvars"
terraform apply -var-file="environments/prod.tfvars"
```

Review the Terraform plan before applying it. These commands manage local configuration files; they do not launch application servers or provision cloud infrastructure.

## Outputs

After applying a configuration, inspect the available outputs:

```bash
terraform output
```

The project exposes the generated configuration path, application name, and selected environment.

## Technology Stack

- Terraform and HCL
- HashiCorp Local Provider
- Git and GitHub
- GitHub Actions
- JSON configuration

## Project Goals

StrataForge is being developed as a learning and portfolio project to demonstrate Infrastructure as Code fundamentals, modular design, environment management, validation, and CI automation.

## Roadmap

- [x] Initial Terraform configuration
- [x] Input variables and validation
- [x] Reusable application configuration module
- [x] Development and production variable files
- [x] GitHub Actions validation workflow
- [ ] Automated tests and stronger configuration checks
- [ ] Expanded infrastructure automation examples
- [ ] Optional cloud deployment using a controlled budget

## Author

**Shreena Mani**

B.Tech Computer Science Engineering | Cloud Computing & Automation

GitHub: [@ItsShreena](https://github.com/ItsShreena)