# ---------------------------------------------------------
# Primary GKE Cluster (us-central1)
# ---------------------------------------------------------

resource "google_container_cluster" "primary" {
  name     = var.primary_cluster_name
  location = var.primary_region
  project  = var.project_id

  network         = google_compute_network.gke_vpc.name
  subnetwork      = google_compute_subnetwork.primary_subnet.name
  networking_mode = "VPC_NATIVE"

  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false

  node_config {
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "primary-pods"
    services_secondary_range_name = "primary-services"
  }

  depends_on = [
    google_project_service.required_apis
  ]
}

# ---------------------------------------------------------
# Primary Node Pool
# ---------------------------------------------------------

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.primary_region
  cluster    = google_container_cluster.primary.name
  project    = var.project_id
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      environment = "assignment"
      cluster     = "primary"
    }
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
}
