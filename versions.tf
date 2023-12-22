terraform {
  required_version = "~>1.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.71, < 6"
    }
  }
}


provider "google" {
  project = "burner-aayvyas"
  region  = "us-central"
}