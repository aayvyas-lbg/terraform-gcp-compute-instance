output "name" {
  value       = google_compute_instance.compute_instance.name
  description = "The name of the Compute Engine instance."
}

output "machine_type" {
  description = "The machine type of the Compute Engine instance."
  value       = google_compute_instance.compute_instance.machine_type
}

output "labels" {
  description = "The labels applied to the Compute Engine instance."
  value       = google_compute_instance.compute_instance.effective_labels
}

output "tags" {
  description = "The tags applied to the Compute Engine instance."
  value       = google_compute_instance.compute_instance.tags
}

output "subnetwork" {
  description = "The subnetwork where the Compute Engine instance is located."
  value       = google_compute_instance.compute_instance.network_interface[0].subnetwork
}
