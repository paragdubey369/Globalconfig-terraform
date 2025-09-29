
# Project Title

A brief description of what this project does and who it's for

# Infrastructure Automation in Air-Gapped Environments

This repository contains an **infrastructure automation framework** designed for **air-gapped datacenters** using **Terraform, Ansible, and GitLab CI/CD**.  
The project was developed as part of a thesis and internship at **Hitachi Rail** (2025), focusing on **railway automation software deployment** in restricted, offline environments.

---

## 🚀 Project Overview

- **Provisioning:** Automated VM creation on **Proxmox VE** using Terraform.
- **Configuration:** Post-provisioning setup with **Ansible** (RKE2, HAProxy, MariaDB/Galera, MaxScale, Hauler).
- **CI/CD:** End-to-end GitLab pipelines for infrastructure validation, deployment, and lifecycle management.
- **Air-gapped Ready:** Works without internet access by leveraging internal registries, templates, and dependency mirroring.
- **Reusable Template:** Modular design that allows cloning for other infrastructure projects (e.g., Fortify, Splunk).

---

## 🏗️ Architecture

1. **Terraform Layer**  
   - Provisions VMs in Proxmox from **Cloud-Init enabled templates**.  
   - Modular setup (`control_nodes`, `worker_nodes`, `bastion`, `db_nodes`, etc.).  
   - Global environment configuration (`uat.tfvars`, `devm.tfvars`, etc.).

2. **Ansible Layer**  
   - Generates dynamic inventories from Terraform outputs.  
   - Installs and configures platform components:
     - **RKE2** (lightweight Kubernetes)
     - **MariaDB Galera Cluster + MaxScale**
     - **HAProxy** for load balancing
     - **Hauler** for offline container/image distribution

3. **GitLab CI/CD**  
   - Stages: `check-infra → plan → create-infra → configure-platform → install-apps → destroy-infra`  
   - Ensures idempotent deployments.  
   - Tracks state with `.tfstate` stored in a GitLab branch.  
   - Integrates with **Ansible Runner** via SSH for platform provisioning.

---

## 📂 Repository Structure

```text
├── terraform/           # Terraform modules and environment definitions
│   ├── modules/         # Reusable VM provisioning modules
│   ├── envs/            # Environment-specific configs (devm, uat, test)
│   └── global.tfvars    # Global environment definitions
│
├── ansible/             # Ansible playbooks and inventories
│   ├── inventories/     # Static environment inventories (devm, uat, test)
│   ├── roles/           # Roles for RKE2, MariaDB, HAProxy, etc.
│   └── playbooks/       # Deployment playbooks
│
├── .gitlab-ci.yml       # GitLab CI/CD pipeline definition
├── README.md            # Project documentation
└── docs/                # Additional diagrams, thesis references

## Getting started
Getting Started
Prerequisites

Proxmox VE (with Cloud-Init enabled templates)

Terraform (≥ 1.6.x)

Ansible (≥ 2.15.x)

GitLab Runner (inside air-gapped network)

RHEL-based VMs as base images


Clone the Repo

https://github.com/paragdubey369/Globalconfig-terraform.git

Provision Infrastructure
cd terraform/envs/uat
terraform init
terraform plan -var-file=uat.tfvars
terraform apply -var-file=uat.tfvars

Configure Platform
ansible-playbook -i ansible/inventories/uat.yaml ansible/playbooks/install-platform.yaml
## Features
Features Implemented

✅ Proxmox VM provisioning with Terraform

✅ Modular environment definitions (uat, devm, test)

✅ GitLab pipeline with infra checks and state tracking

✅ Ansible Runner integration for RKE2, HAProxy, MariaDB setup

✅ Inventory validation between Terraform & Ansible configs

✅ Reusable template repo for future projects

## Roadmap

Roadmap

 Automate Helm-based application deployments on RKE2

 Add monitoring & logging stack (Prometheus, Grafana, Loki)

 Enhance security hardening (vaulted secrets, CIS compliance)

 Expand template repository for external projects


## License

License

This project is for research and internal deployment use. Licensing terms TBD

## Authors
Parag Dubey
Engineering Intern @ Hitachi Rail
Focus: Infrastructure Automation | Air-gapped Cloud | Terraform & Ansible
