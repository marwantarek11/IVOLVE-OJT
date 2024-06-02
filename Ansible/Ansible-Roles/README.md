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


1- ![1](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/ef13321b-c27c-4f14-8e08-62881c0d3e4c)

2- ![app version](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/f05ab223-7dd1-450c-aff0-bfdfd1fa5159)

This documentation provides a step-by-step guide to organizing Ansible playbooks using roles and creating an Ansible role for installing Jenkins, Docker, and OpenShift CLI. By following these steps, you can maintain a clean and modular structure for your Ansible projects, making them more manageable and reusable.
