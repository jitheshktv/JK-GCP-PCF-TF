// Allow open access between internal VMs for a PCF deployment
resource "google_compute_firewall" "cf-internal" {
  name    = "${var.env_name}-cf-internal"
  network = "${var.network_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [
    "${var.management_1_cidr}",
    "${var.management_2_cidr}",
    "${var.management_3_cidr}",
    "${var.pas_1_cidr}",
    "${var.pas_2_cidr}",
    "${var.pas_3_cidr}",
    "${var.services_1_cidr}",
    "${var.services_2_cidr}",
    "${var.services_3_cidr}"
  ]
}
