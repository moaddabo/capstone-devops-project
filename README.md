# capstone-devops-project

# DevOps Capstone Project

## Overview

This project demonstrates an end-to-end DevOps CI/CD pipeline using Jenkins, Docker, Terraform, AWS, and security scanning tools. The goal is to automate the build, security validation, containerization, and deployment of a Java web application using Infrastructure as Code (IaC) and modern DevOps practices.

---

## Architecture

GitHub → Jenkins → Maven → Docker → Docker Hub → Checkov → Terraform → AWS EC2

### Workflow

1. Source code is stored in GitHub.
2. Jenkins automatically pulls the latest code.
3. Maven compiles and packages the application.
4. Docker builds a container image.
5. Docker image is pushed to Docker Hub.
6. Checkov scans Terraform code for security and compliance issues.
7. Terraform provisions infrastructure in AWS.
8. Application is deployed to an EC2 instance.
9. Application is accessible through the EC2 public IP.

---

## Technologies Used

### CI/CD

* Jenkins
* GitHub

### Build Tools

* Maven

### Containerization

* Docker
* Docker Hub

### Infrastructure as Code

* Terraform

### Cloud Platform

* AWS EC2
* AWS IAM
* AWS Security Groups

### Security

* Checkov

### Monitoring (Optional)

* Prometheus
* Grafana

---

## Project Structure

```text
capstone-devops-project/
│
├── app/
│   ├── src/
│   ├── pom.xml
│   └── Dockerfile
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── screenshots/
│
├── Jenkinsfile
│
└── README.md
```

---

## Jenkins Pipeline Stages

### 1. Source Checkout

Jenkins retrieves the latest code from GitHub.

### 2. Build

Maven compiles and packages the application.

### 3. Docker Build

A Docker image is created from the application artifact.

### 4. Docker Push

The image is pushed to Docker Hub.

### 5. Security Scan

Checkov scans Terraform code for security issues.

### 6. Infrastructure Deployment

Terraform provisions AWS infrastructure and deploys the application.

---

## Security Controls

* IAM-based AWS access
* Security Groups restricting inbound traffic
* Infrastructure scanning using Checkov
* Containerized deployment
* Infrastructure managed as code

---

## AWS Resources Created

* EC2 Instance
* Security Group
* SSH Key Pair

---

## Screenshots

The following screenshots are included in the project:

* AWS EC2 Instance
* Security Group Configuration
* Jenkins Dashboard
* Jenkins Pipeline Execution
* Docker Image Build
* Docker Hub Repository
* Checkov Scan Results
* Terraform Deployment
* Running Application

---

## Results

The project successfully demonstrates:

* Continuous Integration
* Continuous Delivery
* Infrastructure as Code
* Security Validation
* Automated Cloud Deployment

---

## Future Improvements

* OWASP Dependency Check
* OWASP ZAP Dynamic Security Testing
* AWS Secrets Manager Integration
* Prometheus Monitoring
* Grafana Dashboards
* OPA Policy Enforcement

---

## Author

**Omid Moaddab**

DevOps Capstone Project
