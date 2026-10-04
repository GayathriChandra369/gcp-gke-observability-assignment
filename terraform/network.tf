# ---------------------------------------------------------
# VPC Network
# ---------------------------------------------------------

resource "google_compute_network" "gke_vpc" {
  name                    = "gke-assignment-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  project                 = var.project_id

  depends_on = [
    google_project_service.required_apis
  ]
}

# ---------------------------------------------------------
# Primary Region Subnet (us-central1)
# ---------------------------------------------------------

resource "google_compute_subnetwork" "primary_subnet" {
  name          = "gke-primary-subnet"
  ip_cidr_range = "10.10.0.0/20"
  region        = var.primary_region
  network       = google_compute_network.gke_vpc.id
  project       = var.project_id

  secondary_ip_range {
    range_name    = "primary-pods"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "primary-services"
    ip_cidr_range = "10.30.0.0/20"
  }
}

# ---------------------------------------------------------
# Secondary Region Subnet (us-east1)
# ---------------------------------------------------------

resource "google_compute_subnetwork" "secondary_subnet" {
  name          = "gke-secondary-subnet"
  ip_cidr_range = "10.11.0.0/20"
  region        = var.secondary_region
  network       = google_compute_network.gke_vpc.id
  project       = var.project_id

  secondary_ip_range {
    range_name    = "secondary-pods"
    ip_cidr_range = "10.21.0.0/16"
  }

  secondary_ip_range {
    range_name    = "secondary-services"
    ip_cidr_range = "10.31.0.0/20"
  }
}
