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
1- ![1]![WhatsApp Image 2024-06-05 at 4 06 34 AM](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/7863db05-1cde-4f78-8486-e0755d4afa30)
2- ![2]![WhatsApp Image 2024-06-05 at 4 07 28 AM](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/3656b78c-53f2-4cc1-be06-357dbf832c16)
3- ![3]![WhatsApp Image 2024-06-05 at 4 08 04 AM](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/e1b94747-73a8-4bb5-8d40-955ec2f9667a)





