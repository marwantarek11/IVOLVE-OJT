# Ansible MySQL Database Configuration Playbook

This Ansible playbook is designed to automate the installation of MySQL, 
creation of a database, user, and granting necessary permissions. 
It targets web servers specified in the inventory file and requires encrypted 
sensitive data like passwords stored in `secrets.yml`.

## Purpose

The purpose of this playbook is to streamline the setup of MySQL databases on web servers,
facilitating efficient management of database configurations in server environments.

## Playbook Overview

- **Install MySQL**: Installs MySQL server package on target servers.
- **Ensure MySQL Service**: Ensures that MySQL service is enabled and started.
- **Create Database**: Creates a MySQL database named 'ivolve'.
- **Create MySQL User**: Creates a MySQL user 'ivolve' with a password from Ansible Vault and grants all privileges on all databases.
- **Grant User Permissions**: Grants the user 'ivolve' permission to create tables in the 'ivolve' database.

## Photos for results
![1](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/d224b2cc-509c-4cf0-a8b7-db6c1cd2da3e)
![2](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/f4d32721-5521-478c-8472-2a331176e664)
![3](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/3c037f55-1dd8-4189-8b40-d72cc1cce3e5)
![4](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/b9af0e08-482c-4ab3-907a-1c6311466098)
![5](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/74cd9277-5247-426b-8e61-ebb333fccd40)
![6](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/00cd8829-e868-460f-8fd1-68dd70ffaed6)








