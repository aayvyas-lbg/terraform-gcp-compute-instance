data "google_compute_network" "network" {
  name = var.network
}

locals {
  # TODO: Write unit test case to check if subnet is in us-central only
  subnetwork = try([for subnets in data.google_compute_network.network.subnetworks_self_links : subnets if strcontains(subnets, "us-central")][0])
  mandatory_labels = {
    "cost_centre" = "ccoe"
    "managed_by"  = "terraform"
    "workspace"   = lower(terraform.workspace)
  }
  # Converts all the user supplied labels to lower case - as GCP does not allow upper case labels
  compliant_labels = { for k, v in var.labels : lower(k) => lower(v) }
  labels           = merge(local.compliant_labels, local.mandatory_labels) # TODO: Write unit test case to validate the end result of labels logic

  tags = {
    "nodejs"      = ["http-server-3000", "https-server-443", "no-ssh"],
    "spring-boot" = ["http-server-8080", "https-server-8080", "no-ssh"],
    "flask"       = ["http-server-5000", "https-server-443", "no-ssh"],
    "jenkins"     = ["http-server-8080", "https-server-8080", "http-server-5002", "https-server-5002"],
  }
}

resource "google_compute_instance" "compute_instance" {
  name = var.name

  network_interface {
    network = var.network
    # Subnetwork should be in us-central1 only
    subnetwork = local.subnetwork
  }
  boot_disk {
    auto_delete = false
    initialize_params {
      image  = "debian-cloud/debian-11"
      size   = var.size
      labels = local.labels
    }
  }

  machine_type = var.machine_type

  zone = "us-central1-a"

  metadata_startup_script = fileexists("./bootstrap.sh") ? file("./bootstrap.sh") : null # TODO: Write integration test to validate the bootstrap script logic works as expected

  labels = local.labels
  tags   = local.tags[var.app_type] # TODO: Write unit test case to validate the tags are properly assigned
}