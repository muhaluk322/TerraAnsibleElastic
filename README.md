# Elasticsearch Deployment Guide on AWS

This guide provides a step-by-step process to deploy and configure an Elasticsearch instance on AWS using Terraform for infrastructure setup and Ansible for software configuration. 

## Prerequisites

Ensure you have the following installed on your local machine:

- **Terraform**: [Download and install Terraform](https://www.terraform.io/downloads.html)
- **Ansible**: [Installation guide for Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- AWS Access Key ID and AWS Secret Access Key

## Configuration Overview

The deployment process is divided into two main parts: setting up the infrastructure using Terraform and configuring Elasticsearch using Ansible.

### Part 1: Infrastructure Setup with Terraform

#### Step 1: Set Up AWS Credentials

Set your AWS credentials as environment variables for enhanced security:

```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
```

#### Step 2: Initialize and Apply Terraform

Navigate to your Terraform directory and run the following commands:

```bash
cd terraform
terraform init
terraform apply
```

Confirm the changes by typing `yes` when prompted.

#### Step 3: Generate SSH Key

After Terraform execution, generate an SSH key for Ansible:

```bash
terraform output -raw private_key > ../ansible/ssh-key.pem
chmod 400 ../ansible/ssh-key.pem
```

### Part 2: Elasticsearch Configuration with Ansible

#### Step 4: Update Ansible Inventory

Move to the Ansible directory and update the `inventory.ini` file:

```ini
[elasticsearch]
<IP> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=./ssh-key.pem
```

Replace `<IP>` with the public IP address of your AWS instance.

#### Step 5: Execute Ansible Playbook

Configure Elasticsearch by running the Ansible playbook:

```bash
ansible-playbook -i inventory.ini main.yml
```

#### Step 6: Verify Elasticsearch and Kibana Installations

Verify that both Elasticsearch and Kibana are running by accessing the following URLs:

```plaintext
Elasticsearch: https://<IP>:9200
Kibana: http://<IP>:5601
```

Credentials for Elasticsearch and Kibana:

```plaintext
Username: elastic
Password: elastic
```

Replace `<IP>` with your instance's IP address. Ensure SSL is configured for Elasticsearch.
By following these steps, you should have a fully functional Elasticsearch instance running on AWS, configured and ready for use.
