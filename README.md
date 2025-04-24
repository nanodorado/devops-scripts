# 🛠️ DevOps Scripts & Infrastructure Playground

This repository contains modular, real-world DevOps resources designed to demonstrate practical skills with cloud infrastructure, automation, monitoring, containerization, and troubleshooting.

Each folder represents a core area of DevOps and cloud engineering, with examples that can be reused, extended, or presented during interviews or workshops.

---

## 📦 Project Structure

### `terraform/`
Infrastructure as Code using **Terraform** to provision:
- AWS VPC with public/private subnets
- EC2 instance (bastion)
- ECS Cluster
- RDS (PostgreSQL)
- IAM roles and security groups

🔹 **Includes:** `main.tf`, `variables.tf`, `user_data.sh`, `terraform.tfvars.example`

---

### `ansible/`
Automated configuration management using **Ansible** to:
- Install system packages
- Configure Docker and system services
- Customize login message (`motd`)

🔹 **Includes:** `site.yml`, inventory, role `common` with `tasks/` and `files/`

---

### `ssm-patching/`
Patch management automation using **AWS Systems Manager (SSM)**:
- Tag EC2 instances into patch groups
- Register patch baselines
- Schedule maintenance windows

🔹 **Includes:** `run-patching.sh`, `README.md` explaining use

---

### `monitoring/`
A complete local monitoring stack using **Prometheus** and **Grafana** with Docker Compose:
- Tracks metrics (e.g., CPU, memory, disk)
- Simulates Node Exporter integration

🔹 **Includes:** `docker-compose.yml`, `prometheus.yml`, setup docs

---

### `containers/`
Simulated container-based microservice for ECS:
- Basic NGINX dashboard container
- Task definition ready for AWS Fargate

🔹 **Includes:** `Dockerfile`, `task-definition.json`, `README.md`

---

### `troubleshooting/`
Realistic shell scripts for identifying and resolving common production issues:
- CPU spikes
- Disk usage
- Network diagnostics
- Log review

🔹 Useful for on-call scenarios and interview demos

---

### `iot-mqtt/`
Simulated **IoT device** that sends sensor data over **MQTT**:
- Uses `paho-mqtt` in Python
- Connects to local Mosquitto broker via Docker

🔹 **Includes:** `device.py`, `start-broker.sh`, `requirements.txt`

---

## 🚀 How to Use This Repo

1. Clone the repo:
   ```bash
   git clone https://github.com/nanodorado/devops-scripts.git
   cd devops-scripts
