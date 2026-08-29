# Task 2 – Install NGINX on Azure VM using Terraform

## What I Practiced

In this task, I created an Azure Linux VM using Terraform and used a shell script to install NGINX automatically when the VM started.

## What I Used

* Terraform
* Azure
* Ubuntu 24.04
* Shell script
* NGINX
* NSG

## How I Did It

I created the VM and passed the `nginx.sh` script using Terraform's `custom_data`.

The script updates the packages, installs NGINX, enables the service, and starts it.

I also added a Public IP and an NSG rule to allow inbound HTTP traffic on port 80.

## Result

The NGINX service was verified as active, and I was able to open the NGINX welcome page using the VM's Public IP.
