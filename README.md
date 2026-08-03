# GitHub Actions + Terraform CI/CD Pipeline

## What is GitHub Actions?

GitHub Actions is a CI/CD automation platform built into GitHub. It lets you create workflows that run on events such as push, pull request, and manual triggers to build, validate, test, and deploy your code.

## What is a Pipeline?

A pipeline is a sequence of automated steps that execute in order:

1. Fetch code from the repository.
2. Initialize and configure tools.
3. Validate the infrastructure.
4. Plan and apply Terraform changes.

## This repository

This project contains a simple Terraform configuration that creates:

- An AWS VPC with CIDR block `10.0.0.0/16`
- One AWS subnet with CIDR block `10.0.0.0/24`

## Repository structure

- `.github/workflows/test.yml` - GitHub Actions workflow for Terraform CI/CD.
- `provider.tf` - AWS provider configuration and required provider version.
- `main.tf` - Terraform resources for VPC and subnet.

## Workflow steps

The GitHub Actions workflow performs the following steps:

- Checkout repository code
- Setup Terraform using `hashicorp/setup-terraform`
- Run `terraform init`
- Run `terraform validate`
- Run `terraform plan` and save the plan to `tfplan`
- Run `terraform apply -auto-approve tfplan`

## Prerequisites

- Terraform installed locally (recommended 1.0+)
- AWS credentials configured in GitHub Secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

## Usage

Run the following commands locally:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Cleanup

To delete resources created by Terraform:

```bash
terraform destroy
```

## Notes

- The workflow currently triggers on pushes to the `main` branch.
- Adjust CIDR blocks, region, and Terraform configuration as needed.
 