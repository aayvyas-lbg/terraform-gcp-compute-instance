module "terraform-gcp-compute-instance" {
  source       = "../.."
  name         = var.name
  network      = var.network
  size         = var.size
  machine_type = var.machine_type
  labels       = var.labels
  app_type     = "nodejs"

}
