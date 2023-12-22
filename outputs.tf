output "name" {
  value = google_compute_instance.compute_instance.name
}

output "machine_type" {
  value = google_compute_instance.compute_instance.machine_type
}

output "labels" {
  value = google_compute_instance.compute_instance.effective_labels
}

output "tags" {
  value = google_compute_instance.compute_instance.tags
}

output "subnetwork" {
  value = google_compute_instance.compute_instance.network_interface[0].subnetwork
}
