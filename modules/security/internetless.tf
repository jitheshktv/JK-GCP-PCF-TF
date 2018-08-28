// Allow ingress between internal VMs for a PCF deployment
resource "google_compute_firewall" "cf-internal-ingress" {
  count = "${var.internetless ? 1 : 0}"

  name    = "${var.env_name}-cf-internal-ingress"
  network = "${var.network_name}"

  priority = 900

  direction = "INGRESS"

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

// Allow egress between internal VMs for a PCF deployment
resource "google_compute_firewall" "cf-internal-egress" {
  count = "${var.internetless ? 1 : 0}"

  name    = "${var.env_name}-cf-internal-egress"
  network = "${var.network_name}"

  priority = 1000

  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  destination_ranges = [
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

// Allow OpsMgr and BOSH Director to talk to GCP APIs, e.g. googleapis.com
// commenting the below after enabling private google access
/*  resource "google_compute_firewall" "cf-allow-external-egress" {
  count = "${var.internetless ? 1 : 0}"

  name    = "${var.env_name}-cf-allow-external-egress"
  network = "${var.network_name}"

  priority = 1100

  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  target_service_accounts = ["${var.opsman_service_account_email}"]

  destination_ranges = ["0.0.0.0/0"]
} */

// Deny all outbound internet traffic
resource "google_compute_firewall" "cf-deny-external-egress" {
  count = "${var.internetless ? 1 : 0}"

  name    = "${var.env_name}-cf-deny-external-egress"
  network = "${var.network_name}"

  priority = 1200

  direction = "EGRESS"

  deny {
    protocol = "icmp"
  }

  deny {
    protocol = "tcp"
  }

  deny {
    protocol = "udp"
  }

  destination_ranges = ["0.0.0.0/0"]
}
