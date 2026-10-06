# ---------------------------------------------------------
# Artifact Registry Repository
# ---------------------------------------------------------

resource "google_artifact_registry_repository" "main" {
  project       = var.project_id
  location      = var.primary_region
  repository_id = "gke-apps"
  format        = "DOCKER"
  description   = "Docker repository for GKE assignment application images"

  depends_on = [
    google_project_service.required_apis
  ]
}
