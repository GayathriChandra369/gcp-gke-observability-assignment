# GCP GKE Observability Assignment

This project demonstrates a production-oriented application deployment
on Google Cloud Platform with two applications, multi-pod deployments, and full observability.

## Technologies
- GCP, GKE, Terraform, Docker, Kubernetes
- BigQuery, Cloud Logging, Grafana
- Java, Spring Boot

## Architecture
The solution consists of:
- GCP infrastructure provisioned using Terraform
- Primary and secondary GKE clusters
- Two Spring Boot applications
- Artifact Registry for container images
- Kubernetes deployments and services
- Horizontal Pod Autoscaling
- Ingress/load balancing
- Centralized logging
- BigQuery log analysis
- Grafana observability dashboard

## Repository Structure
- `architecture/`       Architecture diagram
- `terraform/`          GCP infrastructure as code
- `apps/`               Spring Boot applications
- `kubernetes/`         Kubernetes manifests
- `observability/`      BigQuery queries and Grafana dashboard
- `docs/`               Setup and design documentation
- `screenshots/`        Evidence/screenshots

## Setup
See `docs/setup.md`