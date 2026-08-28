# Terraform Azure Practice

This folder contains my Day 2 Terraform practice with Microsoft Azure.

In this practice, I used Terraform to create multiple Azure resources and worked with the `count` meta-argument to create more than one VM from the same resource block.

## What I Created

* Resource Group
* Virtual Network
* Subnet
* Network Interfaces
* 2 Linux Virtual Machines

The resources were created successfully in Azure.

## Terraform Files

* `provider.tf` - Azure provider configuration
* `main.tf` - Azure resources
* `variables.tf` - Variables used in the configuration
* `terraform.tfvars` - Variable values
* `outputs.tf` - Output values
* `backend.tf` - Backend configuration
* `.gitignore` - Files excluded from Git
* `.terraform.lock.hcl` - Provider version information

## Commands Used

`terraform init`

`terraform fmt`

`terraform validate`

`terraform plan`

`terraform apply`

`terraform destroy`

I used these commands to initialize, format, validate, preview, create, and remove the Azure resources.

## Terraform State

Terraform uses a state file to keep track of the resources it manages. The state file is kept locally and is not pushed to GitHub.

## Purpose

The main purpose of this practice was to understand how Terraform can create multiple Azure resources using the `count` meta-argument and manage them through code.