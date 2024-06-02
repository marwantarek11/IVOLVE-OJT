# Terraform AWS Infrastructure Setup

This repository contains Multi-Tier Application Deployment with Terraform to set up an AWS infrastructure consisting of a VPC, public and private subnets, an EC2 instance, and RDS database.

## Table of Contents
- Prerequisites
- Scripts Overview
  - 1. main.tf
  - 2. outputs.tf
  - 3. variables.tf
- Usage
- Results
  
## Prerequisites
- Terraform installed on your local machine
- AWS CLI configured with appropriate credentials
- An existing key pair in the specified AWS region

## Scripts Overview

### 1. `main.tf`
This script sets up the main AWS resources:
- A VPC
- Public and private subnets
- An Internet Gateway
- Route tables and associations
- An EC2 instance
- RDS instances


### 2. `variables.tf`
This script defines the variables used in the Terraform configuration:
- AWS region
- VPC CIDR block
- VPC name
- Public and private subnet CIDR blocks
- Availability zones
- AMI ID
- EC2 instance type
- Key pair name
- RDS instance specifications

### 3. `outputs.tf`
This script defines the outputs for the created resources:
- VPC ID
- Public subnet ID
- Private subnet IDs
- EC2 instance ID
- RDS instance endpoints

### Usage
Ensure you have Terraform installed and the AWS CLI configured.
Clone the repository and navigate to the project directory.
Initialize Terraform:

```bash
terraform init
```
Review the Terraform plan to see what will be created:
```bash
terraform plan
```
Apply the Terraform plan to create the resources:
```bash
terraform apply
```
After the deployment, you can check the output values for the created resources:
```bash
terraform output
```
### Results
1- ![1](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/123f29fa-02fb-4290-bdee-f907229a5683)
2- ![2](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/f0bb814d-e0d8-41b0-ac56-e042c05dd865)
3- ![3](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/e843ea7c-4c3b-451c-8699-845eff28d387)




