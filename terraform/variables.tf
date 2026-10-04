variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gcp-gke-assignment"
}

variable "region" {
  description = "Default region"
  type        = string
  default     = "us-central1"
}

variable "primary_region" {
  description = "Primary GKE cluster region"
  type        = string
  default     = "us-central1"
}

variable "secondary_region" {
  description = "Secondary GKE cluster region"
  type        = string
  default     = "us-east1"
}

variable "primary_cluster_name" {
  description = "Primary GKE cluster name"
  type        = string
  default     = "gke-primary"
}

variable "secondary_cluster_name" {
  description = "Secondary GKE cluster name"
  type        = string
  default     = "gke-secondary"
}
