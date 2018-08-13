resource "google_compute_network" "pcf-network" {
  name = "${var.env_name}-${var.network_name}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "management-1-subnet" {
  name          = "${var.env_name}-management-1-subnet"
  ip_cidr_range = "${var.management_1_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "management-2-subnet" {
  name          = "${var.env_name}-management-2-subnet"
  ip_cidr_range = "${var.management_2_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "management-3-subnet" {
  name          = "${var.env_name}-management-3-subnet"
  ip_cidr_range = "${var.management_3_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "pas-1-subnet" {
  name          = "${var.env_name}-pas-1-subnet"
  ip_cidr_range = "${var.pas_1_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "pas-2-subnet" {
  name          = "${var.env_name}-pas-2-subnet"
  ip_cidr_range = "${var.pas_2_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "pas-3-subnet" {
  name          = "${var.env_name}-pas-3-subnet"
  ip_cidr_range = "${var.pas_3_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "services-1-subnet" {
  name          = "${var.env_name}-services-1-subnet"
  ip_cidr_range = "${var.services_1_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "services-2-subnet" {
  name          = "${var.env_name}-services-2-subnet"
  ip_cidr_range = "${var.services_2_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "services-3-subnet" {
  name          = "${var.env_name}-services-3-subnet"
  ip_cidr_range = "${var.services_3_cidr}"
  network       = "${google_compute_network.pcf-network.self_link}"
  region        = "${var.region}"
}
