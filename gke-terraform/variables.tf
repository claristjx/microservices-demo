variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "online-boutique"
}