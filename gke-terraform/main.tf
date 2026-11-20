terraform {
  required_version = ">= 1.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable the APIs GKE needs
resource "google_project_service" "apis" {
  for_each = toset([
    "container.googleapis.com",
    "compute.googleapis.com",
  ])
  service            = each.key
  disable_on_destroy = false
}

# GKE Autopilot cluster (Google manages the nodes)
resource "google_container_cluster" "boutique" {
  name                = var.cluster_name
  location            = var.region
  enable_autopilot    = true
  deletion_protection = false

  depends_on = [google_project_service.apis]
}