# Define the provider (GCP in this case)
provider "google" {
  credentials = file("auth.json")
  project     = "cryptic-dahlia-401407"
  region      = "us-central1-a"
}



# Create four VM instances in the network
resource "google_compute_instance" "vm1" {
  count = 2  # Create 2 instances
  name         = "vm-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    }

}

resource "google_compute_instance" "vm2" {
  count = 2  # Create 2 instances
  name         = "vm-${count.index + 3}"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
     network_interface {
    network = "default"
    }
 
}
