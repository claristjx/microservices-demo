output "cluster_name" {
  value = google_container_cluster.boutique.name
}

output "cluster_location" {
  value = google_container_cluster.boutique.location
}