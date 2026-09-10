# Terraform + Ansible Infrastructure Automation

This project automates the provisioning, configuration and basic hardening of Ubuntu 24.04 servers on Hetzner Cloud using Terraform and Ansible.
---

## Table of Contents

- [Quickstart](#quickstart)
- [Architecture](#architecture)
- [Terraform](#terraform)
- [Ansible](#ansible)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)
- [Skills Demonstrated](#skills-demonstrated)


---

## Features

- Provision Ubuntu 24.04 servers on Hetzner Cloud
- Configure Hetzner Firewall
- Inject SSH public keys
- Create administrative users
- Configure passwordless sudo
- Install and configure NGINX
- Install and configure Fail2Ban
- Harden SSH access
- Generate dynamic Ansible inventory
- Fully automated server provisioning

---

## Architecture

```text
                Terraform
                    │
                    ▼
          Hetzner Cloud Infrastructure
                    │
                    ▼
             Ubuntu 24.04 Server
                    │
                    ▼
                 Ansible
        ├── User Management
        ├── SSH Configuration
        ├── NGINX
        ├── Fail2Ban
        └── System Updates
```

---

## Technology Stack

- Terraform
- Ansible
- Ubuntu 24.04
- Hetzner Cloud
- NGINX
- Fail2Ban
- SSH

---

## Workflow

```text
Terraform
│
├── Hetzner Cloud Server
├── Hetzner Firewall
└── SSH Key
        │
        ▼
Ubuntu 24.04 Server
        │
        ▼
Ansible
├── Admin User
├── SSH Configuration
├── NGINX
├── Fail2Ban
└── System Updates
```

---

## Terraform

Terraform is responsible for infrastructure provisioning.

### Resources

* Ubuntu 24.04 Server
* Hetzner Firewall
* SSH Key Injection
* Outputs for Ansible Inventory

### Deployment

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Ansible

Ansible is responsible for server configuration and software deployment.

### Automated Tasks

#### System Management

* Update package cache
* Upgrade installed packages

#### Web Server

* Install NGINX
* Enable NGINX service
* Start NGINX automatically

#### Security

* Install Fail2Ban
* Enable Fail2Ban service
* Configure SSH key authentication

#### User Management

* Create administrative user
* Deploy authorized SSH key
* Configure passwordless sudo access

---

## Usage

Verify server access:

```bash
ssh artur@<server_ip>
```

Become root:

```bash
sudo -i
```

Verify NGINX:

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


## Project Structure

```text
terraform-ansible-hetzner/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
│
├── ansible/
│   ├── playbook.yml
│   ├── inventories/
│   ├── roles/
│   └── files/
│
└── README.md
```

---

## Getting Started

### Prerequisites

- Terraform
- Ansible
- Hetzner Cloud Account
- Hetzner API Token
- SSH Key Pair

### Clone the repository

```bash
git clone git@github.com:A-Marbach/terraform-ansible-hetzner.git
cd terraform-ansible-hetzner
```

### Configure Terraform

```bash
cp terraform.tfvars.example terraform.tfvars
```

Insert your Hetzner API Token.

```hcl
hcloud_token = "your-token"
```

### Initialize Terraform

```bash
terraform init
```

### Deploy Infrastructure

```bash
terraform apply
```

### Generate the Ansible Inventory

```bash
terraform output -raw ansible_inventory > ../ansible/inventories/hosts.ini
```

### Configure the Server

```bash
cd ../ansible

ansible-playbook -i inventories/hosts.ini playbook.yml
```

---

## Verification

Verify SSH connectivity.

```bash
ssh artur@<server_ip>
```

Verify NGINX.

```bash
systemctl status nginx
journalctl -u nginx

Verify Fail2Ban.

```bash
systemctl status fail2ban
journalctl -u fail2ban
fail2ban-client status
```

---

## Skills Demonstrated

- Linux Administration
- Infrastructure as Code
- Configuration Management
- SSH and User Management
- Firewall Configuration
- Service Management with systemd
- Troubleshooting with journalctl
- Infrastructure Automation

- Infrastructure as Code
- Linux Administration
- Configuration Management
- Cloud Provisioning
- Server Hardening
- SSH Automation
- Infrastructure Automation

---

## Screenshots

Screenshots of the deployment process can be added here.

- Terraform Apply
- Hetzner Cloud
- SSH Login
- NGINX
- Fail2Ban
- Terminal Output

---

## Future Improvements

- Multi-server deployments
- Modular Terraform structure
- Reusable Ansible roles
- HTTPS with Let's Encrypt
- Monitoring integration
