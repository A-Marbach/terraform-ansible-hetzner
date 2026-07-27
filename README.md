# Terraform + Ansible Infrastructure Automation

Automated provisioning and configuration of secure Ubuntu servers on Hetzner Cloud using **Terraform** and **Ansible**.

This project demonstrates how Infrastructure as Code (IaC) can be used to provision cloud resources and automatically configure production-ready Linux servers.

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
Terraform Apply
        │
        ▼
Provision Cloud Server
        │
        ▼
Generate Ansible Inventory
        │
        ▼
Run Ansible Playbook
        │
        ▼
Production Ready Linux Server
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
```

Verify Fail2Ban.

```bash
systemctl status fail2ban

fail2ban-client status
```

Open the server in your browser.

```
http://<server_ip>
```

---

## Skills Demonstrated

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
