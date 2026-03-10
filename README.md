# 🚀 GLPI Advanced One-Command Deployment

[![GLPI CI/CD](https://github.com/yourname/glpi-auto-deploy/actions/workflows/deploy.yml/badge.svg)](https://github.com/yourname/glpi-auto-deploy/actions/workflows/deploy.yml)
[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Nginx](https://img.shields.io/badge/Nginx-009639?logo=nginx&logoColor=white)](https://nginx.org/)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?logo=jenkins&logoColor=white)](https://www.jenkins.io/)

A professional-grade DevOps project demonstrating automated deployment of **GLPI (IT Asset Management)** with integrated CI/CD, SSL/TLS security, automated backups, and infrastructure-as-code.

---

## 🌟 Key Features

- **🛡️ Full Security**: Integrated Nginx Reverse Proxy with automated SSL certificate generation.
- **🏗️ CI/CD Ready**: Jenkins pre-configured with Docker-out-of-Docker (DooD) capabilities.
- **💾 Auto-Backup**: Dedicated backup service that performs daily MariaDB dumps with retention policies.
- **🛠️ One-Command Install**: A robust installation script that handles dependencies, certificates, and environment setup.
- **⚡ GitHub Actions**: CI pipeline to validate docker configs and perform health checks on push.

---

## 🏗️ Architecture Overview

The system consists of 5 microservices working in harmony:

1.  **Nginx**: Gateway with SSL Termination and Routing.
2.  **GLPI**: The core application (PHP/Apache).
3.  **MariaDB**: High-performance database.
4.  **Jenkins**: Automation engine for CI/CD tasks.
5.  **Backup**: Cron-based service for disaster recovery.

---

## 🚀 Quick Start

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourname/glpi-auto-deploy.git
cd glpi-auto-deploy
```

### 2️⃣ Run the Installer
```bash
./scripts/install.sh
```

---

## 🌐 Access Points

| Service | Protocol | URL |
| :--- | :--- | :--- |
| **GLPI Dashboard** | HTTPS | [https://localhost](https://localhost) |
| **Jenkins Panel** | HTTPS | [https://localhost/jenkins](https://localhost/jenkins) |
| **Backup Storage** | Local | `./backups/` |

> **Note**: Default credentials for GLPI (first login): `glpi` / `glpi`.
> Jenkins initial admin password can be found in the container logs or `/var/jenkins_home/secrets/initialAdminPassword`.

---

## 📂 Project Structure

```text
glpi-auto-deploy/
├── .github/workflows/    # GitHub Actions CI/CD Pipeline
├── jenkins/              # Custom Jenkins Dockerfile
├── nginx/                # Nginx Config & SSL Certs
├── scripts/              # Automation & Backup Logic
├── backups/              # Automated DB Snaphots
├── .env                  # Environment Variables
└── docker-compose.yml    # Infrastructure Definition
```

---

## 👨‍💻 Skills Demonstrated

- **Infrastructure as Code (IaC)**: Docker Compose for complex multi-service orchestration.
- **Reverse Proxying**: Nginx configuration with SSL and path-based routing.
- **DevOps Automation**: Bash scripting for environment bootstrapping.
- **CI/CD**: Advanced GitHub Actions and Jenkins integration.
- **Disaster Recovery**: Automated backup strategies and retention logic.
