# Terraform Azure Practice

This repository contains my Terraform practice work with Microsoft Azure.

I used Terraform to create Azure resources and understand how Infrastructure as Code works in practice. Instead of creating each resource manually from the Azure Portal, I defined the infrastructure in Terraform configuration files and used Terraform commands to create and manage it.

## What I Created

The infrastructure created during this practice includes:

- Resource Group
- Virtual Network
- Subnet
- Network Interface
- Linux Virtual Machine configuration

The Resource Group, Virtual Network, Subnet and Network Interface were successfully created in Azure.

The Linux VM configuration is included in the project, but the VM could not be created because the `Standard_B1s` VM size was not available for the subscription in the selected region.

## Terraform Configuration

The project currently contains these Terraform files:

- `provider.tf` - Azure provider configuration
- `main.tf` - Azure resources
- `variables.tf` - Terraform variables
- `terraform.tfvars` - Variable values
- `outputs.tf` - Terraform output values
- `backend.tf` - Terraform backend configuration
- `.gitignore` - Files that should not be committed
- `.terraform.lock.hcl` - Locked provider information

## Commands Used

During the setup and deployment, I used:

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply`

`terraform output`

`terraform init` was used to initialize the project and install the Azure provider.

`terraform validate` was used to check the configuration before deployment.

`terraform plan` was used to see what Terraform was going to create.

`terraform apply` was used to create the resources in Azure.

`terraform output` was used to check the output values after the resources were created.

## Azure Resources

Resource Group: `bhargav-tf-rg`

Virtual Network: `bhargav-tf-vnet`

Subnet: `bhargav-tf-subnet`

Network Interface: `bhargav-tf-nic`

## Terraform State

Terraform keeps information about the resources it manages in its state file.

For this project, the state is using the local backend.

Terraform state files and variable files containing sensitive information are not included in the GitHub repository.

## Purpose of This Project

I created this project to get practical experience with Terraform and understand how Terraform can be used to create and manage Azure infrastructure through code.