# ---------------------------------------------------------
# Secondary GKE Cluster (us-east1)
# ---------------------------------------------------------

resource "google_container_cluster" "secondary" {
  name     = var.secondary_cluster_name
  location = var.secondary_region
  project  = var.project_id

  network         = google_compute_network.gke_vpc.name
  subnetwork      = google_compute_subnetwork.secondary_subnet.name
  networking_mode = "VPC_NATIVE"

  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false

  node_config {
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "secondary-pods"
    services_secondary_range_name = "secondary-services"
  }

  depends_on = [
    google_project_service.required_apis
  ]
}

# ---------------------------------------------------------
# Secondary Node Pool
# ---------------------------------------------------------

resource "google_container_node_pool" "secondary_nodes" {
  name       = "secondary-node-pool"
  location   = var.secondary_region
  cluster    = google_container_cluster.secondary.name
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
      cluster     = "secondary"
    }
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
}
