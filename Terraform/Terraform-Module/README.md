# Terraform Modules

## Objective
The objective of this lab is to modularize Terraform configurations using modules. By creating reusable modules, you can efficiently manage resources such as VPC, subnets, EC2 instances, and an RDS database.

## Overview
In this lab, we'll use Terraform to provision a Virtual Private Cloud (VPC), create subnets within the VPC, launch EC2 instances, and set up an RDS (Relational Database Service) database. Instead of defining all resources in a single Terraform configuration file, we'll organize our infrastructure as reusable modules.

## Modules
1. *VPC Module*: This module sets up the Virtual Private Cloud (VPC) with specified CIDR block, route tables, and internet gateway.
2. *Subnets Module*: Subnets will be created within the VPC using this module. You can specify the number of subnets, their CIDR blocks, and other relevant configurations.
3. *EC2 Instance Module*: This module will launch EC2 instances within the specified subnets. You can define the instance type, AMI, key pair, and other parameters.
4. *RDS Module*: The RDS module will provision a managed relational database service within the VPC. Configuration options include database engine, instance class, storage, and security settings.



### 1. *Identify Components:*
    a. VPC
    b. Subnets
    c. EC2 Instances
    d. RDS Database

### 2. *Create Modules:*
   - *VPC Module:*
     - Parameters: CIDR block, Tags
     - Resources: VPC, Subnets, Route Tables, Internet Gateway (if needed)
   
   - *Subnets Module:*
     - Parameters: VPC ID, List of Subnet CIDR blocks, Tags
     - Resources: Subnets, Route Tables Association
   
   - *EC2 Instance Module:*
     - Parameters: Instance type, AMI ID, Subnet ID, Tags
     - Resources: EC2 Instance
   
   - *RDS Database Module:*
     - Parameters: DB Engine, DB Instance Class, Allocated Storage, Subnet IDs, Tags
     - Resources: RDS Database Instance

### 3. *Implement the Modules:*
   - Define each module in its respective .tf file.
   - Utilize input variables and output values for passing data between modules.
   - Structure your main Terraform configuration file to call these modules with specific parameters.
   

### 4. *Directory Structure:*
```bash
.
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── rds
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── vpc
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
├── output.tf
├── terraform.tfstate
└── variable.tf
```

   

### 5. *Photos & Outputs:*
1 -  ![vpc](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/65ceca7c-85c2-4789-8fb0-fc1b6c5e5060)
2 -  ![ec2](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/7e803260-8943-41ef-80cc-f0c764d5b541)
3 -  ![rds](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/d0c0886a-3af8-4bbf-a4a0-9bbe6bc03c65)


By following these steps, you'll have a modularized Terraform configuration that can be easily reused and maintained across different projects or environments.
