# LAB_20
create private subnet and launch EC2, configure security groups, connect to the instance using bastion host.
# AWS Infrastructure Setup Guide

## 1. VPC Creation
- Log in to AWS Management Console.
- Go to VPC Dashboard.
- Click on "Create VPC".
- In Resources to create choose VPC and more
- Enter CIDR block (e.g., 10.0.0.0/16).
- Create public and private subnets.
- Create VPC

## 2. Bastion Host Setup
- Launch EC2 instance in the public subnet.
- Choose an appropriate AMI (Amazon Machine Image), preferably a minimal Linux distribution like Amazon Linux or Ubuntu.
- Ensure that the security group associated with this instance allows SSH (port 22) access from your IP address.

## 3. Launch an EC2 Instance in the Private Subnet:
- Launch another EC2 instance, but this time in the private subnet.
- Choose the desired AMI and instance type.
- Ensure that the security group associated with this instance only allows incoming traffic from the bastion host's security group on port 22.

## 4. Configure Security Groups:
- Create two security groups: one for the bastion host and one for the private instance.
- For the bastion host security group, allow incoming SSH (port 22) traffic from your IP address.
- For the private instance security group, allow incoming SSH (port 22) traffic only from the bastion host's security group.

## 5. Connect to the Bastion Host:
- Use SSH to connect to the bastion host from your local machine:
- `ssh -i <path_to_private_key> ec2-user@<bastion_public_ip>`
- `ssh -i <path_to_private_key> ec2-user@<private_instance_private_ip>`

## 6. Results
![ec2](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/a2a5a0f3-368c-47e1-82f2-532ef71a6448)
![bastion-ec2](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/48cec68a-f6c9-4685-96fc-107fa4b0042c)




