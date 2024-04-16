# Terraform Project Overview

## Introduction
This README provides an overview of the Terraform project structure, which is designed to provision and manage AWS cloud infrastructure for an Elasticsearch environment. The project is modular, allowing for separation of concerns and reusability of code.

## Requirements
- **Terraform Version**: 0.12 or later is recommended.
- **Target Cloud**: AWS.
- **AWS Access Key ID and AWS Secret Access Key**

## Project Structure
- `ec2/`: Module for provisioning EC2 instances.
  - `main.tf`: Contains resource definitions for EC2 instances.
  - `variables.tf`: Defines variables specific to the EC2 module.
  - `outputs.tf`: Outputs attributes of the EC2 resources.
- `sg/`: Module for creating security groups.
  - `main.tf`: Contains resource definitions for security groups.
  - `variables.tf`: Defines variables specific to the security group module.
  - `outputs.tf`: Outputs attributes of the security group resources.
- `ssh-key/`: Module for creating an SSH key pair.
  - `main.tf`: Contains resource definitions for SSH key pair.
  - `variables.tf`: Defines variables specific to the SSH key module.
  - `outputs.tf`: Outputs attributes of the SSH key resources.
- `vpc/`: Module for setting up a VPC.
  - `main.tf`: Contains resource definitions for VPC, subnets, and related resources.
  - `variables.tf`: Defines variables specific to the VPC module.
  - `outputs.tf`: Outputs attributes of the VPC resources.
- `main.tf`: Main Terraform file that calls the modules and configures the provider.
- `variables.tf`: Root-level variables file that defines common variables across modules.
- `outputs.tf`: Root-level outputs file that can be used to display information post-deployment.
- `terraform.tfstate`: Terraform state files that track the state of managed resources (should be managed carefully and not edited manually).
- `README.md`: This file, explaining project setup and structure.

## Modules Description
Each module in this project handles a specific part of the AWS infrastructure:
- **VPC**: Sets up the virtual private cloud environment with public and private subnets, internet gateway, and route tables.
- **Security Group (SG)**: Manages the security group configurations to control inbound and outbound traffic.
- **SSH Key**: Generates an SSH key pair for secure access to EC2 instances.
- **EC2**: Provisions and manages EC2 instances that will host Elasticsearch nodes.

## Configuration Variables
Variables are managed in the `variables.tf` files within each module and the root directory. These variables allow for customization of the infrastructure resources. For example:
- `region`: AWS region where resources will be created.
- `instance_type`: EC2 instance type to be used.
- `ami_id`: Amazon Machine Image ID for the EC2 instances.
- `allowed_ports`: List of ports allowed for the security group.

These variables should be reviewed and set according to your deployment requirements.

## Using This Project
To use this project, clone the repository, and ensure you have initialized Terraform and configured AWS CLI with the necessary permissions. Update variables as needed and follow these steps:
```bash
terraform init    # Initialize Terraform
terraform plan    # Review changes to be applied
terraform apply   # Apply the infrastructure changes
```

To destroy the provisioned resources, use:
```bash
terraform destroy # Destroy the resources
```
