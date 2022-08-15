terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5.0"
    }
  }
}

provider "google" {
  project = "gothic-sled-291722"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params{
        image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20220810"
    }
  }

  network_interface {
    network = "default"
  }
}