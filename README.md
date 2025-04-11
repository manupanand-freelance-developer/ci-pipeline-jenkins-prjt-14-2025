# 🛠️ Jenkins CI with Docker on a Single Node (Terraform + Ansible + Vault + GitHub Actions)

This project automates the provisioning and configuration of a production-ready Jenkins Continuous Integration (CI) environment on AWS using a single EC2 instance. The instance acts as both the **controller** and **agent**, capable of handling Docker-based builds. This setup is ideal for small-scale, self-managed CI/CD workloads with scalability in mind.

---

## 📦 Tech Stack

- **Terraform** – Infrastructure provisioning (AWS EC2, VPC, Security Groups)
- **Ansible** – Configuration management (Jenkins + Docker setup)
- **GitHub Actions** – CI for provisioning pipeline
- **HashiCorp Vault** – Secure storage for secrets (e.g., SSH keys, API tokens)
- **Jenkins** – CI server for building Docker containers

---

## 🚀 Features

- Fully automated Jenkins installation and setup via Ansible
- Jenkins user configured with Docker access
- Docker installed and configured for build jobs
- Terraform-managed infrastructure on AWS (EC2, Networking)
- GitHub Actions workflow to provision infrastructure and run playbooks
- Secrets securely retrieved from Vault
- Designed to be production-grade and scalable in the future

---

## 🌐 Architecture Overview
```
[ GitHub Actions ]
       |
       v
[ Terraform ] ───► [ AWS EC2 Instance ]
                        ├─ Jenkins (Controller + Agent)
                        └─ Docker
[ Vault ] ─────── secrets (SSH keys, tokens, etc)
```

## 📁 Project Structure

```
jenkins-ci-project/
├── ansible/
│   ├── playbook.yml
│   └── roles/
│       └── jenkins/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .github/workflows/
│   └── deploy.yml
├── vault/
│   └── secrets.hcl
├── README.md
└── LICENSE
```

---

## 🧑‍💻 How It Works

1. **GitHub Actions** triggers on workflow dispatch.
2. It pulls secrets from **Vault** (e.g., AWS credentials, vpc id, username, password).
3. Runs **Terraform** to provision the AWS EC2 instance.
4. Executes **Ansible** to:
   - Install Jenkins and Docker
   - Add Jenkins to Docker group
   - Configure and start Jenkins service
5. Jenkins is now accessible via the public IP with Docker build support.

---

## 🛡️ Security

- All sensitive data (e.g., AWS access keys, username, password, Jenkins secrets) are stored and accessed from **HashiCorp Vault**.
- Jenkins home is stored on EC2 with a dedicated volume (optional).
- SSH access is restricted by Security Groups (SSH allowed only from admin IP).

---

## 📦 Requirements

- AWS Account
- GitHub Repository
- Vault Server (local or HCP)
- Terraform v1.4+
- Ansible v2.12+
- Docker (for local testing, optional)

---



## 🔧 To-Do / Roadmap

Add auto-scaling for agents

Migrate to Jenkins on Kubernetes

Use S3/EFS for Jenkins home persistence

Vault dynamic secrets for AWS roles

### 📜 License

MIT License