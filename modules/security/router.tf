/**********
 * PAS LB *
 **********/

resource "google_compute_firewall" "cf-public" {
  name    = "${var.env_name}-cf-public"
  network = "${var.env_name}-${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["${var.env_name}-httpslb", "${var.env_name}-cf-ws", "${var.env_name}-isoseglb"]
}

resource "google_compute_firewall" "cf-health_check" {
  name    = "${var.env_name}-cf-health-check"
  network = "${var.env_name}-${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["${var.env_name}-httpslb", "${var.env_name}-cf-ws", "${var.env_name}-isoseglb"]
}

/****************
 * Diego SSH LB *
 ****************/

resource "google_compute_firewall" "cf-ssh" {
  name    = "${var.env_name}-cf-ssh"
  network = "${var.env_name}-${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["2222"]
  }

  target_tags = ["${var.env_name}-cf-ssh"]
}
