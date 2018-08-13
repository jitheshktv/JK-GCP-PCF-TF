resource "google_compute_image" "ops-manager-image" {
  name = "${var.env_name}-ops-manager-image"

  timeouts {
    create = "20m"
  }

  raw_disk {
    source = "https://storage.googleapis.com/ops-manager-${replace(var.opsman_image_url, "/.*ops-manager-(.*)/", "$1")}"
  }
}

resource "google_compute_address" "ops-manager-ip" {
  name = "${var.env_name}-ops-manager-ip"
}

resource "google_compute_instance" "ops-manager" {
  name         = "${var.env_name}-ops-manager"
  machine_type = "${var.opsman_machine_type}"
  zone         = "${element(var.zones, 1)}"
  tags         = ["${var.env_name}-ops-manager-external"]

  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "${google_compute_image.ops-manager-image.self_link}"
      size  = 150
    }
  }

  network_interface {
    subnetwork = "${var.env_name}-management-1-subnet"

    access_config {
      nat_ip = "${google_compute_address.ops-manager-ip.address}"
    }
  }

  service_account {
    email = "${var.opsman_service_account_email}"
    scopes = ["cloud-platform"]
  }

  metadata = {
    ssh-keys               = "${format("ubuntu:%s", tls_private_key.ops-manager.public_key_openssh)}"
    block-project-ssh-keys = "TRUE"
  }
}

resource "tls_private_key" "ops-manager" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}
