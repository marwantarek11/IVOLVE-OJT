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

## Output & results
1- 
```bash
marwan@marwan-virtual-machine:~/IVOLVE_OJT/IVOLVE_Training/Ansible/Mysql_lab$ ansible-playbook -i inventory playbook_mysql.yml --ask-vault-pass
Vault password: 

PLAY [Install MySQL, create database, user, and grant permissions] *************

TASK [Gathering Facts] *********************************************************
ok: [192.168.129.130]

TASK [Install MySQL] ***********************************************************
ok: [192.168.129.130]

TASK [Ensure MySQL service is enabled and started] *****************************
ok: [192.168.129.130]

TASK [Create database named 'ivolve'] ******************************************
ok: [192.168.129.130]

TASK [Create MySQL user 'ivolve' with password from Ansible Vault] *************
changed: [192.168.129.130]

TASK [Grant user 'ivolve' permission to create tables in 'ivolve' database] ****
changed: [192.168.129.130]

PLAY RECAP *********************************************************************
192.168.129.130            : ok=6    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

2- verfiy ivolve database
```bash
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| ivolve             |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql>
```
3- create table named "ivolve-table"
```bash
mysql> CREATE TABLE ivolve_table (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     username VARCHAR(50) NOT NULL,
    ->     email VARCHAR(100) NOT NULL,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES;
+------------------+
| Tables_in_ivolve |
+------------------+
| data             |
| ivolve_table     |
| users            |
+------------------+
3 rows in set (0.01 sec)

mysql>
```
