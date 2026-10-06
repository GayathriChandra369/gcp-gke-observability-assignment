# ---------------------------------------------------------
# Cloud Logging Sink → BigQuery
# ---------------------------------------------------------

resource "google_logging_project_sink" "bigquery_sink" {
  name        = "gke-logs-to-bigquery"
  project     = var.project_id
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.logs.dataset_id}"

  filter = "resource.type=\"k8s_container\""

  unique_writer_identity = true

  depends_on = [
    google_bigquery_dataset.logs
  ]
}

# Grant the log sink permission to write to BigQuery
resource "google_bigquery_dataset_iam_member" "log_sink_writer" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.logs.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = google_logging_project_sink.bigquery_sink.writer_identity
}
