# LAP_19 
Create AWS account, set billing alarm, create 2 IAM groups (admin-developer), admin group has admin
permissions, developer group only access to S3, create admin-1 user console access only with MFA & admin-2-prog
user with cli access only and list all users and groups using commands, create dev-user with programmatic and
console access (take screenshots access EC2, S3)


# AWS Environment Setup Guide

This guide outlines the steps to set up an AWS environment including creating an AWS account, configuring billing alarms, creating IAM groups and users with specific permissions, and accessing resources like EC2 and S3.

## Steps

### 1. Create AWS Account
- Visit the AWS website and follow the instructions to create a new AWS account.

### 2. Set Billing Alarm
- Go to the AWS Management Console.
- Navigate to the "alarms" section.
- Select "Billing" from dashboard and then "Create Alarms".
- Set up the billing alarm based on your preferences and thresholds.
- In Alarm state trigger choose (OK).
- Send a notification to the following SNS topic (Create new topic) and enter your date.

### 3. Create IAM Groups
- Go to the IAM console.
- Click on "User groups" in the left-hand menu.
- Click on "Create New Group".
- Name the group "admin" and attach policies with admin permissions.
- Repeat the above steps to create a group named "developer" and attach policies for S3 access.

### 4. Create IAM Users
- Go to the IAM console.
- Click on "Users" in the left-hand menu.
- Click on "Add user".
- Create "admin-1" user and attach to admin group.
- open admin-1 and select security credentials then assgin console access and MFA.
- Create "admin-2" user and attach to admin group.
- open admin-2 and select security credentials then assgin CLI access.
- Create "dev-user" with both programmatic and console access.

### 5. List Users and Groups Using AWS CLI
- Use the AWS CLI to list users and groups:

- aws iam list-groups

- ![Screenshot from 2024-05-28 02-49-47](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/9fadde6b-bf93-48d7-ae14-ba7051619e5f)

- aws iam list-users
- 
- ![Screenshot from 2024-05-28 02-50-27](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/33787c46-a3b8-4f99-b2b1-9d63043bfb6e)



### 6. Verify Permissions
- Log in as each user and attempt to access EC2 and S3 resources via the console or CLI to verify permissions.
- Log in Admin-1 using Multi-factor Authentication.
- ![Screenshot from 2024-05-28 02-56-50](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/b00b6f1c-c027-4ffb-99c5-9b811a79b94b)
- ![Screenshot from 2024-05-28 03-08-23](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/30cce83c-a518-485a-bf61-22f948ab41ff)
- ![Screenshot from 2024-05-28 03-10-17](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/ca7111f4-1e67-4906-b16a-681247c67607)
- ![Screenshot from 2024-05-28 03-13-05](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/a25efafc-c424-4d33-b891-d397c54924c9)





