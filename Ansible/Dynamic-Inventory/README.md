# Dynamic-Inventory-AWS

## Objective

The objective of this project is to set up Ansible dynamic inventories to automatically discover and manage infrastructure. Dynamic inventories allow Ansible to automatically scale playbook execution across different environments, making it easier to manage infrastructure as it grows or changes.

## Overview

This project demonstrates the setup and use of Ansible dynamic inventories to manage infrastructure. The steps include configuring Ansible to use dynamic inventories and creating playbooks that leverage this feature to manage multiple environments effectively.

## Repository Structure
```bash
IVOLVE_Training/
└── Terraform/
    └── Dynamic-Inventory/
        ├── ansible.cfg
        ├── aws_ec2.yml
        ├── playbook.yml
        └── README.md
        └── key111.pem
```

- `ansible.cfg`: Configuration file for Ansible, specifying the use of the dynamic inventory script.
- `aws_ec2.yml`: Custom Python script to generate the dynamic inventory for Ansible.
- `playbook.yml`: Sample Ansible playbook that utilizes the dynamic inventory.
- `README.md`: This file, providing an overview and instructions for the project.
- `key111.pem`: This file, used for connecting your localhost with instances as public key for ssh  
## Setup Instructions

### Prerequisites

- Ansible installed on your local machine.
- Python installed on your local machine.

### Step-by-Step Guide

1. **Configure Ansible to Use the Dynamic Inventory:**

    Ensure that your ansible.cfg file is correctly set up to use the dynamic inventory script:
    ```bash
    [defaults]
    inventory = ~/ec2-ansible/aws_ec2.yml
    private_key_file = ~/ec2-ansible/key111.pem
    ```

2. **Create the Dynamic Inventory Script:**

    The aws_ec2.yml script is a crucial part of this setup. It dynamically generates the list of hosts and groups that Ansible will manage. The script                 should output the inventory in a YAML format that Ansible can understand. Here is an example structure of the YAML output:
   ```bash
   plugin: aws_ec2
   regions:
     - us-east-1
   filters:
     instance-state-name: running
   ```
    Modify the script to suit your infrastructure discovery needs.

3. **Sample Playbook:**

    The playbook.yml file contains a sample playbook that uses the dynamic inventory to execute tasks on the discovered infrastructure. Here is an example of a 
    simple playbook:
   ```bash
   ---
    - name: Create ivolve file
      hosts: all
      remote_user: ubuntu
      become: yes  # This allows Ansible to execute tasks with sudo privileges, if required
  
      tasks:
        - name: Create the ivolve file
          ansible.builtin.file:
            path: /home/ubuntu/ivolve  # Specify the path where you want to create the ivolve file
            state: touch  # Ensure the file exists, creating it if necessary
   ```


    This playbook ensures that create file named ivolve on all hosts discovered by the dynamic inventory script.


4. **Results&Outputs:**

   ```bash
    ubuntu@ip-172-31-17-251:~$ ls
    ivolve
    ubuntu@ip-172-31-17-251:~$ 
    ubuntu@ip-172-31-16-18:~$ ls
    ivolve
    ubuntu@ip-172-31-16-18:~$ 
