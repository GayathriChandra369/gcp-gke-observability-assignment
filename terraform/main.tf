# GCP GKE Observability Assignment
# Main entry point for Terraform configuration

# This file intentionally left minimal.
# Resources are organized in separate files:
# - apis.tf         → GCP API enablement
# - network.tf      → VPC and subnets
# - gke-primary.tf  → Primary GKE cluster
# - gke-secondary.tf → Secondary GKE cluster
# - artifact-registry.tf → Container registry
# - bigquery.tf     → BigQuery dataset
# - logging.tf      → Log sink configuration
