# AWS VPC Setup with EC2 Instances and Load Balancer

This guide provides step-by-step instructions to set up a Virtual Private Cloud (VPC) on Amazon Web Services (AWS) along with launching EC2 instances running Nginx and Apache web servers, and configuring a Load Balancer to distribute traffic to these instances.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with appropriate permissions to create VPCs, EC2 instances, and Load Balancers.
- Basic knowledge of AWS services and networking concepts.

## Step-by-Step Guide

### 1. Create a Virtual Private Cloud (VPC) with 2 Subnets:

#### Using AWS Management Console:
1. Navigate to the VPC dashboard.
2. Click on "Create VPC" and provide a name and CIDR block (e.g., `10.0.0.0/16`).
3. Create two subnets within this VPC:
   - Subnet 1:
     - CIDR: `10.0.1.0/24`
     - Availability Zone: `us-east-1a`
   - Subnet 2:
     - CIDR: `10.0.2.0/24`
     - Availability Zone: `us-east-1b`
     - ![Screenshot from 2024-05-28 22-24-57](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/027a8357-844b-43d5-afe9-8b22f9136de3)
     - ![Screenshot from 2024-05-28 22-34-00](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/0b4e2ac5-ee5c-4132-9af9-67eec073468b)

### 2. Launch 2 EC2 Instances:

#### Using AWS Management Console:
1. Navigate to the EC2 dashboard.
2. Launch two EC2 instances within the created subnets:
   - Choose an appropriate instance type and configuration.
   - Optionally, configure advanced settings such as IAM role, user data, etc.
   - Use user data to install Nginx and Apache web servers:
     ```bash
     #!/bin/bash
     sudo apt-get update
     sudo apt-get install -y apache2
     sudo systemctl start apache2
     sudo systemctl enable apache2 
     systemctl restart apache2
     ```
     ```bash
     #!/bin/bash
     sudo apt-get update
     sudo apt-get install -y nginx
     sudo systemctl start nginx
     sudo systemctl enable nginx   
     sudo systemctl restart nginx
     ```
![ec2-apache](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/1a7ba49e-41f6-4051-a740-e986f5faf34b)
![ec2-nginx](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/130d62d8-7676-4fab-bdc8-f6ddfb40dbe3)

### 3. Create and Configure a Load Balancer (ALB/ELB):

#### Using AWS Management Console:
1. Navigate to the Load Balancer dashboard.
2. Click on "Create Load Balancer" and choose the appropriate type (Application Load Balancer or Classic Load Balancer).
3. Configure the Load Balancer settings:
   - Define listeners (e.g., HTTP on port 80).
   - Configure security groups to allow traffic from the internet to the Load Balancer.
   - Define target groups and register the EC2 instances created in the previous step.
   - Configure health checks to monitor the health of EC2 instances.
   - Obtain the DNS name of the Load Balancer to access the web servers.
![loadbalancer](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/3486a59a-711c-49f0-9dac-e13745ab7756)
![targetgroup](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/d48a1ba2-1865-4416-99df-cd3932fe0ba6)

## Additional Considerations

- Ensure proper configuration of security groups to allow traffic to and from the Load Balancer and EC2 instances.
- Consider using Auto Scaling Groups for better scalability and fault tolerance.
- Regularly monitor the EC2 instances, Load Balancer, and overall system performance using AWS CloudWatch or other monitoring tools.
- Consider using AWS Elastic File System (EFS) for shared storage if needed by both Nginx and Apache.
![apache](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/1607cc0e-4f37-483e-b71b-4fdbe31f3bf7)
![nginx](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/8300ef36-7f64-422d-9c87-58c70567dc99)

## Conclusion

By following these detailed steps, you'll have successfully set up a VPC with 2 subnets, launched 2 EC2 instances with Nginx and Apache installed, and configured a Load Balancer to distribute traffic to the web servers. This setup provides a scalable and reliable infrastructure for hosting web applications on AWS.
