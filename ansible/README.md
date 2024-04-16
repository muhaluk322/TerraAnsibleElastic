# Ansible Project Overview

## Introduction
This README provides an overview of the Ansible project structure, including details about the included roles, variable definitions, and setup requirements. This project is designed to manage and automate configurations across a series of servers.

## Requirements
- **Ansible Version**: 2.9 or later is required.
- **Target Systems**: Ubuntu 18.04 or newer.
- **Internet Access**: Required for fetching remote packages.

## Project Structure
- `global_vars/`: Contains global variables used across different roles.
  - `vars.yml`: Defines key variables such as version numbers and configuration settings.
- `inventory.ini`: Ansible inventory file defining groups and hosts.
- `main.yml`: Main playbook that includes roles and tasks for deployment.
- `roles/`: Directory containing roles, each designed to handle specific tasks:
  - `elasticsearch/`: Configures and manages an Elasticsearch server.
  - `kibana/`: Sets up and configures Kibana for visualization of Elasticsearch data.
- `README.md`: This file, explaining project setup and structure.

## Roles Description
Each role in this project has a specific function:
- **Elasticsearch**: Automates the deployment and configuration of Elasticsearch.
- **Kibana**: Manages the installation and configuration of Kibana, linking it with Elasticsearch.

## Configuration Variables
Variables are managed in `global_vars/vars.yml` and are crucial for the roles to function correctly. Here are some of the key variables:
- `elk_version`: Version of the ELK stack components to be installed.
- `es_heap_size`: Heap size for Elasticsearch.
- `elastic_pass`: Default password for the Elasticsearch 'elastic' user.

These variables can be customized to suit the deployment needs.

## Using This Project
To use this project, ensure you have configured your `inventory.ini` appropriately and set all necessary variables in `vars.yml`. Run the main playbook using the following command:
```bash
ansible-playbook -i inventory.ini main.yml
