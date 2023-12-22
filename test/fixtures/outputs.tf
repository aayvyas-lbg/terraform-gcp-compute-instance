output "name" {
  value = module.terraform-gcp-compute-instance.name
}

output "machine_type" {
  value = module.terraform-gcp-compute-instance.machine_type
}

output "labels" {
  value = module.terraform-gcp-compute-instance.labels
}

output "tags" {
  value = module.terraform-gcp-compute-instance.tags
}

output "subnetwork" {
  value = module.terraform-gcp-compute-instance.subnetwork
}
