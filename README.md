```
# Elasticsearch Deployment Guide

This guide provides instructions on how to deploy and configure an Elasticsearch instance on AWS using Terraform and Ansible. By following this guide, you will create AWS infrastructure with Terraform and configure Elasticsearch on it using Ansible.

## Prerequisites

Before starting, you need to have the following tools installed on your machine:

- **Terraform**: [Download and install Terraform](https://www.terraform.io/downloads.html)
- **Ansible**: [Installation guide for Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

Additionally, you will need:

- AWS Access Key ID
- AWS Secret Access Key

These credentials are necessary for Terraform to provision resources on AWS.

## Configuration Steps

### 1. Set Up AWS Credentials

It's recommended to use environment variables for AWS credentials to enhance security. Set your credentials as follows:

```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
```

Replace `your-access-key-id` and `your-secret-access-key` with your actual AWS credentials.

### 2. Terraform Initialization and Application

Navigate to the Terraform directory and initialize Terraform:

```bash
cd terraform
terraform init
```

Apply the Terraform configuration:

```bash
terraform apply
```

Type `yes` when prompted to apply the changes.

### 3. Configure SSH Key

Generate an SSH key file from Terraform output:

```bash
terraform output -raw private_key > ../ssh-key.pem
chmod 400 ../ssh-key.pem
```

### 4. Update Ansible Inventory

Update the `inventory.ini` file with the IP address of your new instance:

```ini
[elasticsearch]
<IP> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=./ssh-key.pem
```

Replace `<IP>` with your instance's IP address.

### 5. Execute Ansible Playbook

Run the Ansible playbook to configure Elasticsearch:

```bash
ansible-playbook -i inventory.ini elk-install.yml
```

### 6. Verify Elasticsearch Installation

Access your Elasticsearch instance to confirm it's running:

```plaintext
https://<IP>:9200
```

Replace `<IP>` with your instance's IP address. Ensure you have configured SSL certificates to securely access Elasticsearch over HTTPS.
```