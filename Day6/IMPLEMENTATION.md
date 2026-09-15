# Day 6 – AKS Application Deployment

## 1. Objective

The objective of Day 6 was to deploy a Flask application on Azure Kubernetes Service (AKS), connect it to Azure SQL Database through a Private Endpoint, expose the application through Application Gateway, and automate application deployment using GitHub Actions.

The application supports creating a table, inserting student records, and reading the stored records.

---

## 2. Architecture

Client
  ↓
Application Gateway
  ↓
Kubernetes LoadBalancer Service
  ↓
Flask Pods
  ↓
Private Endpoint
  ↓
Azure SQL Database

* Azure Container Registry (ACR) is used to store the Docker image used by the Flask application.

---

## 3. Infrastructure Setup

Terraform was used to provision the Azure infrastructure.

The Terraform configuration was divided into modules for:

* Resource Group
* Networking
* Azure Container Registry
* AKS
* Azure SQL Database
* Application Gateway

A Virtual Network was created with separate subnets for AKS, Application Gateway, and the SQL Private Endpoint.

The Azure SQL Database was kept outside the AKS cluster and connected through a Private Endpoint with Private DNS.

---

## 4. Flask Application

The backend was developed using Flask and pyodbc.

The application provides APIs to:

* Check application status
* Create the 'students' table
* Insert student records
* Read student records

SQL credentials are provided to the application through environment variables and Kubernetes Secrets instead of being hardcoded in the application.

---

## 5. Docker and ACR

The Flask application was packaged into a Docker image.

The Docker image contains the Python application, required Python packages, and Microsoft ODBC Driver for SQL Server.

The image is pushed to Azure Container Registry, from where AKS pulls the image for deployment.

AKS was given the required 'AcrPull' permission to access the registry.

---

## 6. Kubernetes Deployment

A Kubernetes Deployment was created for the Flask application with **3 replicas**.

A Kubernetes 'LoadBalancer' Service was used to expose the application and distribute requests to the Flask pods.

The application runs inside the containers on port '8000', while the Kubernetes Service exposes it on port '80'.

---

## 7. Application Gateway

Application Gateway was configured as the external entry point for the application.

It receives HTTP requests through its public frontend and forwards them to the Kubernetes LoadBalancer Service.

This provides the following request flow:

Client
  ↓
Application Gateway
  ↓
Kubernetes LoadBalancer
  ↓
Flask Pods

---

## 8. CI/CD Pipeline

GitHub Actions was used to automate application deployment.

The pipeline performs these steps:

1. Checkout the source code.
2. Authenticate with Azure.
3. Login to ACR.
4. Build the Docker image.
5. Push the image to ACR.
6. Get AKS credentials.
7. Update the Kubernetes Deployment with the new image.
8. Wait for the deployment rollout.
9. Verify the pods and Service.

Terraform infrastructure provisioning was kept separate from this application CI/CD pipeline.

---

## 9. Testing

The deployed application was tested through the Application Gateway.

The following operations were verified successfully:

* Application health check
* Creation of the 'students' table
* Insertion of student records
* Retrieval of student records

This verified the complete application flow from the external request through Kubernetes and Flask to Azure SQL Database.

---

## 10. End-to-End Flow

-Deployment Flow:

Code Push
   ↓
GitHub Actions
   ↓
Docker Build
   ↓
Azure Container Registry
   ↓
AKS Deployment
   ↓
Kubernetes Pods

-Application Request Flow:

Client
   ↓
Application Gateway
   ↓
Kubernetes LoadBalancer Service
   ↓
Flask Pods
   ↓
Private Endpoint
   ↓
Azure SQL Database

---

## 11. Technologies Used

* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Azure SQL Database
* Private Endpoint
* Application Gateway
* Docker
* Kubernetes
* Flask
* Python
* pyodbc
* Terraform
* GitHub Actions
