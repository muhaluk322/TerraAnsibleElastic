# Role: Elasticsearch

## Overview
This Ansible role automates the deployment and basic configuration of Elasticsearch on Ubuntu systems. It is specifically tailored for an ELK stack setup and includes tasks such as setting up the repository, installing the software, configuring JVM settings, managing user passwords, and handling service restarts.

## Requirements
- **Ansible Version**: 2.9 or later
- **Operating Systems**: Ubuntu 18.04 or newer
- **Internet Access**: Required to fetch packages from the Elasticsearch repository
- **Additional Modules**: None outside of what Ansible provides

## Dependencies
This role does not depend on any other roles from Ansible Galaxy. Ensure compatibility in terms of variable names and configurations if integrating with other roles for ELK Stack components like Logstash or Kibana.

## Role Variables
- `elk_version`: Version of Elasticsearch to install (e.g., "8.10.1"). Affects the repository URL and package version.
- `es_heap_size`: JVM heap size for Elasticsearch, typically "1g".
- `elastic_pass`: Password for the default Elasticsearch user 'elastic'.

Variables can be configured within `ansible/global_vars/vars.yml`.

## Role Structure
The role includes several components organized into different directories:
- `handlers/`: Includes handler scripts, such as restarting the Elasticsearch service.
- `tasks/`: Contains task files such as `elastic_install.yml` for installation and `elastic_configure.yml` for configuration.

## Role Tasks

### `elastic_install.yml`
- **Import GPG Key**: Ensures the Elasticsearch GPG key is added for package authenticity.
- **Add Repository**: Adds the official Elasticsearch apt repository.
- **Install Elasticsearch**: Installs Elasticsearch and updates the package cache.
- **Manage Service**: Ensures the Elasticsearch service starts on boot and is actively running.

### `elastic_configure.yml`
- **Set JVM Heap Size**: Sets the JVM heap size in a custom configuration file.
- **Reset Elasticsearch Password**: Resets and captures the password for the 'elastic' user.
- **Set Password for 'elastic' User**: Updates the password for the 'elastic' user using the Elasticsearch API.

## Handlers
- **Restart Elasticsearch**: Restarts the Elasticsearch service as required by configuration changes or updates.