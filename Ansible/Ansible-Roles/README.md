# Ansible Playbook using Roles

This repository provides a structured approach to organizing Ansible playbooks using roles. Specifically, it includes an Ansible role for installing Jenkins, Docker, and OpenShift CLI.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Creating the Ansible Role](#creating-the-ansible-role)
- [Playbook Execution](#playbook-execution)
- [Results](#results)

## Introduction

This documentation outlines the steps to organize Ansible playbooks using roles and create an Ansible role for installing Jenkins, Docker, and the OpenShift CLI. This approach helps in maintaining a clean and modular structure for your Ansible playbooks, making them more reusable and easier to manage.

## Prerequisites

Before you start, ensure you have the following installed on your system:

- Ansible 
- A Unix-like operating system (Linux, macOS, etc.)

## Directory Structure

Organizing Ansible playbooks using roles follows a specific directory structure. Here is an example structure for our use case:

```bash
.
├── Ansible-Roles
│   ├── ansible.cfg
│   ├── inventory
│   ├── playbook1.yml
│   ├── README.md
│   └── roles
│       ├── Docker
│       │   └── tasks
│       │       └── main.yml
│       ├── Jenkins
│       │   └── tasks
│       │       └── main.yml
│       └── Openshift
│           └── tasks
│               └── main.yml
```
## Creating the Ansible Role
### Step 1: Initialize the Role
### Step 2: Create Tasks

## Playbook Execution
### Step 1: Create the Playbook
Create a playbook in the Ansible-Roles directory to use the roles:
### Step 2: Run the Playbook
```bash
ansible-playbook -i inventory playbook1.yml
```

## Results


1- 
```bash
PLAY [Playbook to install Jenkins, Docker, and OpenShift CLI 'oc'] *************

TASK [Gathering Facts] *********************************************************
ok: [192.168.129.133]

TASK [Docker : Install required packages] **************************************
ok: [192.168.129.133] => (item=openjdk-11-jre)
ok: [192.168.129.133] => (item=git)
ok: [192.168.129.133] => (item=apt-transport-https)
ok: [192.168.129.133] => (item=ca-certificates)
ok: [192.168.129.133] => (item=curl)
ok: [192.168.129.133] => (item=gnupg)
ok: [192.168.129.133] => (item=lsb-release)

TASK [Docker : Add Docker GPG apt Key] *****************************************
ok: [192.168.129.133]

TASK [Docker : Add Docker Repository] ******************************************
ok: [192.168.129.133]

TASK [Docker : Update apt and install docker-ce] *******************************
ok: [192.168.129.133]

TASK [Docker : Add current user to the docker group] ***************************
ok: [192.168.129.133]

TASK [Docker : Start and enable Docker] ****************************************
ok: [192.168.129.133]

TASK [Jenkins : add jenkins key] ***********************************************
ok: [192.168.129.133]

TASK [Jenkins : add jenkins repo] **********************************************
ok: [192.168.129.133]

TASK [Jenkins : install jenkins] ***********************************************
ok: [192.168.129.133]

TASK [Jenkins : start jenkins service] *****************************************
ok: [192.168.129.133]

TASK [Jenkins : Fetch Jenkins password] ****************************************
ok: [192.168.129.133]

TASK [Jenkins : print jenkins password] ****************************************
ok: [192.168.129.133] => {
    "jenkins_initial_password.stdout": "c81e8b5be4ba4b6a86c4051ae247beee"
}

TASK [Jenkins : enable jenkins to start at boot time] **************************
ok: [192.168.129.133]

TASK [Openshift : Download and install OpenShift CLI] **************************
changed: [192.168.129.133]

TASK [Openshift : Extract OpenShift CLI] ***************************************
skipping: [192.168.129.133]

TASK [Openshift : Ensure oc binary is executable] ******************************
ok: [192.168.129.133]

PLAY RECAP *********************************************************************
192.168.129.133            : ok=16   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```

2- Docker,Jinkens,Openshift versions:
```bash
marwan11@marwan-virtual-machine:~$ docker --version
Docker version 26.1.3, build b72abbb
marwan11@marwan-virtual-machine:~$ jenkins --version
2.452.1
marwan11@marwan-virtual-machine:~$ oc version
Client Version: 4.15.14
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
```

This documentation provides a step-by-step guide to organizing Ansible playbooks using roles and creating an Ansible role for installing Jenkins, Docker, and OpenShift CLI. By following these steps, you can maintain a clean and modular structure for your Ansible projects, making them more manageable and reusable.
