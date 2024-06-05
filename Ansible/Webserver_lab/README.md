# Ansible Apache Web Server Configuration Playbook

This Ansible playbook is designed to automate the configuration of an Apache web server. 
It targets web servers specified in the inventory file and ensures the installation of Apache, deployment of a sample website, and management of the Apache service.

## Purpose

The purpose of this playbook is to streamline the setup and configuration of Apache web servers, 
facilitating efficient management of web server configurations in server environments.

## Playbook Overview

- **Install Apache HTTP Server**: Installs the Apache HTTP Server package on target servers using the `yum` module.
- **Ensure Apache Service**: Ensures that the Apache service is started and enabled to start on boot using the `service` module.
- **Deploy Sample Website**: Copies a sample website content to the default Apache web root directory (`/var/www/html`) using the `copy` module.
- **Restart Apache**: Restarts the Apache service to apply any configuration changes using the `service` module as a handler.


## Photos for results
1- Apply playbook
```bash
$ ansible-playbook -i inventory playbook_webserver.yml 

PLAY [Configure Apache Web Server] *********************************************

TASK [Gathering Facts] *********************************************************
ok: [192.168.129.130]

TASK [Install Apache HTTP Server] **********************************************
ok: [192.168.129.130]

TASK [Ensure Apache service is started and enabled] ****************************
ok: [192.168.129.130]

TASK [Deploy sample website] ***************************************************
ok: [192.168.129.130]

PLAY RECAP *********************************************************************
192.168.129.130            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
2- my localhost web page
![WhatsApp Image 2024-06-05 at 3 53 28 AM](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/7641b4ed-b5c4-4194-8112-952a2ba1e197)
