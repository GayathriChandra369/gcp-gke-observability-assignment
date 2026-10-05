output "project_id" {
  description = "GCP project ID"
  value       = var.project_id
}

output "primary_region" {
  description = "Primary GCP region"
  value       = var.primary_region
}

output "secondary_region" {
  description = "Secondary GCP region"
  value       = var.secondary_region
}

output "vpc_name" {
  description = "VPC network name"
  value       = google_compute_network.gke_vpc.name
}

output "primary_subnet_name" {
  description = "Primary GKE subnet"
  value       = google_compute_subnetwork.primary_subnet.name
}

output "secondary_subnet_name" {
  description = "Secondary GKE subnet"
  value       = google_compute_subnetwork.secondary_subnet.name
}

output "primary_cluster_name" {
  description = "Primary GKE cluster name"
  value       = google_container_cluster.primary.name
}

output "secondary_cluster_name" {
  description = "Secondary GKE cluster name"
  value       = google_container_cluster.secondary.name
}

output "primary_cluster_endpoint" {
  description = "Primary GKE cluster endpoint"
  value       = google_container_cluster.primary.endpoint
  sensitive   = true
}

output "secondary_cluster_endpoint" {
  description = "Secondary GKE cluster endpoint"
  value       = google_container_cluster.secondary.endpoint
  sensitive   = true
}

#output "artifact_registry_repository" {
#  description = "Artifact Registry repository URL"
#  value       = "${var.primary_region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.main.repository_id}"
#}
