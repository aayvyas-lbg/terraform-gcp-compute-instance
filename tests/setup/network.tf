module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 8.1"
  project_id   = "burner-aayvyas"
  network_name = "setup-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "us-central"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
  ]
}