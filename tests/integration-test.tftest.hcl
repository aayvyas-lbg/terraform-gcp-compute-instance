# Setting up network and subnets which will be required as a pre-requisites for tests
# https://developer.hashicorp.com/terraform/tutorials/configuration-language/test#:~:text=the%20helper%20module.-,tests/setup/main.tf,-terraform%20%7B
run "setup_network" {
  module {
    source = "./tests/setup"
  }

}

variables {
  name = "vm-instance"
  size = 10
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
run "create_instance" {
  command = apply
  assert {
    condition     = google_compute_instance.compute_instance.name != null
    error_message = "name of the instance is null"
  }
}


# use data block to get the http response
run "startup script works" {

}