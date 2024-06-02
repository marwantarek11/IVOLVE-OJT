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
![1](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/5622a01c-bad3-45bd-877d-3126cb33ed15)
![2](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/3b0a8a51-e930-41a4-a4bf-57db62c4c42b)
![3](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/0a465988-73d9-4add-b2bf-8650153b795c)

