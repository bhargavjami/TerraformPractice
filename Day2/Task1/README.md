# Terraform Azure Practice

This folder contains my Day 2 Terraform practice with Microsoft Azure.

In this practice, I worked with Terraform meta-arguments to create multiple Linux VMs from the same resource configuration. I first used `count` and then tried the same idea using `for_each`.

## What I Created

* Resource Group
* Virtual Network
* Subnet
* Network Interfaces
* 2 Linux Virtual Machines using `count`
* 2 Linux Virtual Machines using `for_each`

The resources were created successfully in Azure.

## Terraform Files

* `provider.tf` - Azure provider configuration
* `main.tf` - Azure resources
* `variables.tf` - Variables used in the configuration
* `terraform.tfvars` - Variable values
* `.gitignore` - Files excluded from Git
* `.terraform.lock.hcl` - Provider information

## Commands Used

`terraform init`

`terraform fmt`

`terraform validate`

`terraform plan`

`terraform apply`

`terraform destroy`

These commands were used to check the configuration, preview changes, create the resources, and clean them up.

## Terraform State

Terraform uses a state file to keep track of the resources it manages. The state file is kept locally and is excluded from GitHub.

## Purpose

The main purpose of this practice was to understand `count` and `for_each` and how they can be used to create multiple Azure resources from Terraform code.