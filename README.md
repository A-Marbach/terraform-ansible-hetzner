# terraform-ansible-hetzner

This repository contains an Infrastructure as Code (IaC) project for provisioning and configuring Linux servers on Hetzner Cloud using Terraform and Ansible.

The project is designed to automate server deployment, operating system configuration, user management, security hardening, and service installation following modern Infrastructure as Code and Linux administration best practices.

---

# Table of Contents

* Quickstart
* Architecture
* Terraform
* Ansible
* Usage
* Security
* Project Structure
* Future Improvements
* Troubleshooting
* Learning Goals

---

# Quickstart

## Prerequisites

* Terraform
* Ansible
* Hetzner Cloud Account
* Hetzner API Token
* SSH Key Pair

## Steps

Clone this repository:

```bash
git clone git@github.com:A-Marbach/terraform-ansible-hetzner.git
cd terraform-ansible-hetzner
```

Configure your Terraform variables:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Insert your Hetzner API token:

```hcl
hcloud_token = "your-token"
```

Initialize Terraform:

```bash
terraform init
```

Deploy infrastructure:

```bash
terraform apply
```

Generate Ansible inventory:

```bash
terraform output -raw ansible_inventory > ../ansible/inventories/hosts.ini
```

Run Ansible provisioning:

```bash
cd ../ansible

ansible-playbook -i inventories/hosts.ini playbook.yml
```

Connect to the server:

```bash
ssh artur@<server_ip>
```

---

# Architecture

The project provisions and configures the following infrastructure:

```text
Hetzner Cloud
│
├── Ubuntu 24.04 Server
├── Cloud Firewall
├── SSH Key Authentication
│
└── Ansible Configuration
    ├── System Updates
    ├── Nginx Installation
    ├── Fail2Ban Installation
    ├── Admin User Creation
    ├── SSH Key Deployment
    └── Passwordless Sudo
```

---

# Terraform

Terraform is responsible for infrastructure provisioning.

## Resources

* Ubuntu 24.04 Server
* Hetzner Firewall
* SSH Key Injection
* Outputs for Ansible Inventory

## Deployment

```bash
terraform apply
```

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Ansible

Ansible is responsible for server configuration and software deployment.

## Automated Tasks

### System Management

* Update package cache
* Upgrade installed packages

### Web Server

* Install Nginx
* Enable Nginx service
* Start Nginx automatically

### Security

* Install Fail2Ban
* Enable Fail2Ban service
* Configure SSH key authentication

### User Management

* Create administrative user
* Deploy authorized SSH key
* Configure passwordless sudo access

---

# Usage

Verify server access:

```bash
ssh artur@<server_ip>
```

Become root:

```bash
sudo -i
```

Verify Nginx:

```bash
systemctl status nginx
```

Verify Fail2Ban:

```bash
systemctl status fail2ban

fail2ban-client status
```

Open the server in your browser:

```text
http://<server_ip>
```

---

# Security

## Best Practices

❌ Do not commit API tokens, SSH private keys, passwords, or sensitive credentials.

❌ Do not hardcode infrastructure secrets in Terraform files.

✅ Store Hetzner API tokens in Terraform variables or environment variables.

✅ Use SSH key authentication instead of passwords.

✅ Use Fail2Ban to mitigate brute-force attacks.

✅ Use Infrastructure as Code for repeatable deployments.

---

# Project Structure

```text
terraform-ansible-hetzner/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── ansible/
│   ├── playbook.yml
│   ├── files/
│   │   └── artur.pub
│   └── inventories/
│       └── hosts.ini
│
└── README.md
```

---

# Future Improvements

Planned features:

* Custom Nginx Landing Page
* DNS Configuration
* HTTPS with Let's Encrypt
* Automatic Security Updates
* Monitoring Stack
* Kubernetes (K3s)
* GitHub Actions CI/CD Pipeline
* Ansible Roles
* Multi-Server Deployments

---

# Troubleshooting

## SSH Host Key Changed

Remove old host key:

```bash
ssh-keygen -f ~/.ssh/known_hosts -R <server_ip>
```

Reconnect:

```bash
ssh root@<server_ip>
```

## Ansible Cannot Connect

Verify inventory:

```bash
cat inventories/hosts.ini
```

Verify SSH connectivity:

```bash
ssh artur@<server_ip>
```

## Check Service Status

```bash
systemctl status nginx

systemctl status fail2ban
```

---

# Learning Goals

This project demonstrates practical skills in:

* Linux Administration
* Infrastructure as Code
* Terraform
* Ansible
* Server Provisioning
* User Management
* Service Management
* Cloud Infrastructure
* Security Fundamentals
* DevOps Automation

---


