# Automated Multi-Tier Microservices Deployment

## Overview
This project deploys Google's Boutique microservices application using a complete DevOps pipeline.

## Tools Used
- **Docker** - Containerization
- **Terraform** - AWS EC2 provisioning
- **Ansible** - EC2 configuration
- **Kubernetes/minikube** - Container orchestration
- **GitHub Actions** - CI pipeline
- **ArgoCD** - CD synchronization

## Deployment Steps

### 1. Infrastructure (Terraform)
cd terraform
terraform init
terraform apply -var="key_name=microservices-key"

### 2. Configuration (Ansible)
cd ansible
ansible-playbook -i inventory.ini playbook.yml

### 3. Deploy to Kubernetes
kubectl apply -f k8s/

### 4. Access Application
minikube service frontend --url

## CI/CD Pipeline
- GitHub Actions builds Docker images on every push
- ArgoCD automatically syncs Kubernetes manifests
