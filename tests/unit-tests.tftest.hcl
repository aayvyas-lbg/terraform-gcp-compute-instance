variables {
  name    = "vm-instance"
  network = "default"
  size    = 10
  labels = {
    "env"     = "dev"
    "owner"   = "aayush-vyas"
    "purpose" = "terraform-testing"
    "APPid"   = "CS50"
  }
  machine_type = "e2-micro"
  app_type     = "nodejs"
}

provider "google" {
  project = "burner-aayvyas"
  region  = "us-central"
}

run "validate error thrown when boot disk size is not within the range" {
  command = plan

  variables {
    size = 2
  }
  expect_failures = [var.size]
}

run "validate error thrown when name of the compute instance doesnot contains vm in it" {
  command = plan

  variables {
    name = "instance"
  }
  expect_failures = [var.name]
}



run "subnet is in us-central only" {

  command = plan

  assert {
    condition     = strcontains(google_compute_instance.compute_instance.network_interface[0].subnetwork, "us-central")
    error_message = "Subnet is not in us-central"
  }

}

run "labels are all in lower case" {
  command = plan

  assert {
    condition     = length([for key, value in google_compute_instance.compute_instance.labels : key if can(regex("[A-Z. ]+", key)) || can(regex("[A-Z. ]+", value))]) == 0
    error_message = "All labels are not in lowercase "
  }
  expect_failures = []
}

run "labels with error chars" {
  command = plan

  variables {
    labels = {
      "owner" = "aayush.vyas"
    }
  }

  assert {
    condition = length([for key, value in google_compute_instance.compute_instance.labels : key if can(regex("[A-Z. ]+", key))
    || can(regex("[A-Z. ]+", value))]) > 0
    error_message = "All labels are not in lowercase "
  }
}

run "validate error when app_type is not supported" {
  command = plan

  variables {
    app_type = "rust"
  }
  expect_failures = [
    var.app_type
  ]
}
run "when app_type is valid appropriate tags are assigned" {
  command = plan

  variables {
    app_type = "nodejs"
  }
  assert {
    condition     = google_compute_instance.compute_instance.tags == toset(local.tags["nodejs"])
    error_message = "tags are not applied properly"
  }
}