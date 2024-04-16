# Role: Kibana

## Overview
This Ansible role automates the deployment and basic configuration of Kibana on Ubuntu systems as part of an ELK stack. The role includes tasks for adding the necessary repositories, installing the software, configuring Kibana through its YAML file, and ensuring the service is properly managed.

## Requirements
- **Ansible Version**: 2.9 or later
- **Operating Systems**: Ubuntu 18.04 or newer
- **Internet Access**: Required to fetch packages from the official repositories
- **Additional Modules**: None outside of what Ansible provides

## Dependencies
This role does not require any other roles from Ansible Galaxy. If integrating with other roles such as Elasticsearch or Logstash, ensure compatibility in terms of variable names and configurations.

## Role Variables
- `elk_version`: Defines the version of Kibana to install (e.g., "8.10.1"). This variable impacts the repository URL and the installed version.

Variables should be set within `ansible/global_vars/vars.yml`.

## Role Structure
The role includes several components organized into different directories:
- `files/`: Contains the main Kibana configuration file `kibana.yml`.
- `handlers/`: Includes handler scripts, such as restarting the Kibana service.
- `tasks/`: Contains task files such as `kibana_install.yml` for installation and `kibana_configure.yml` for configuration.

## Role Tasks

### `kibana_install.yml`
- **Import GPG Key**: Ensures the Kibana GPG key is added to verify package authenticity.
- **Add Repository**: Configures the package manager to use the official Kibana repository.
- **Install Kibana**: Installs Kibana and updates the package cache.
- **Enable and Start Kibana Service**: Ensures Kibana starts on boot and is running.

### `kibana_configure.yml`
- **Configure kibana.yml**: Copies the main configuration file to the target system.
- **Run Elasticsearch Token Command**: Generates an enrollment token using Elasticsearch's utilities.
- **Extract Token from Response**: Captures the generated token from the command output.
- **Run Kibana Enrollment Token Command**: Uses the token to complete Kibana's setup process.

## Handlers
- **Restart Kibana**: This handler restarts the Kibana service whenever it's needed after configuration changes.