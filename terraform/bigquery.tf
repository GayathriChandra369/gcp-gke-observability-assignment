# ---------------------------------------------------------
# BigQuery Dataset for Log Analysis
# ---------------------------------------------------------

resource "google_bigquery_dataset" "logs" {
  dataset_id  = "gke_logs"
  description = "Dataset for GKE application and cluster logs"
  location    = "US"
  project     = var.project_id

  delete_contents_on_destroy = true

  depends_on = [
    google_project_service.required_apis
  ]
}
