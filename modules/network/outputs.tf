output "network_name" {
  value = "${google_compute_network.pcf-network.name}"
}

output "management_subnet_1_gateway" {
  value = "${google_compute_subnetwork.management-1-subnet.gateway_address}"
}

output "management_1_subnet_cidrs" {
  value = ["${google_compute_subnetwork.management-1-subnet.ip_cidr_range}"]
}

output "management_1_subnet_name" {
  value = "${google_compute_subnetwork.management-1-subnet.name}"
}

output "management_subnet_2_gateway" {
  value = "${google_compute_subnetwork.management-2-subnet.gateway_address}"
}

output "management_2_subnet_cidrs" {
  value = ["${google_compute_subnetwork.management-2-subnet.ip_cidr_range}"]
}

output "management_2_subnet_name" {
  value = "${google_compute_subnetwork.management-2-subnet.name}"
}

output "management_subnet_3_gateway" {
  value = "${google_compute_subnetwork.management-3-subnet.gateway_address}"
}

output "management_3_subnet_cidrs" {
  value = ["${google_compute_subnetwork.management-3-subnet.ip_cidr_range}"]
}

output "management_3_subnet_name" {
  value = "${google_compute_subnetwork.management-3-subnet.name}"
}

output "management_subnets" {
  value = ["${google_compute_subnetwork.management-1-subnet.name}","${google_compute_subnetwork.management-2-subnet.name}","${google_compute_subnetwork.management-3-subnet.name}"]
}

output "pas_1_subnet_gateway" {
  value = "${google_compute_subnetwork.pas-1-subnet.gateway_address}"
}

output "pas_1_subnet_cidrs" {
  value = ["${google_compute_subnetwork.pas-1-subnet.ip_cidr_range}"]
}

output "pas_1_subnet_name" {
  value = "${google_compute_subnetwork.pas-1-subnet.name}"
}

output "pas_2_subnet_gateway" {
  value = "${google_compute_subnetwork.pas-2-subnet.gateway_address}"
}

output "pas_2_subnet_cidrs" {
  value = ["${google_compute_subnetwork.pas-2-subnet.ip_cidr_range}"]
}

output "pas_2_subnet_name" {
  value = "${google_compute_subnetwork.pas-2-subnet.name}"
}

output "pas_3_subnet_gateway" {
  value = "${google_compute_subnetwork.pas-3-subnet.gateway_address}"
}

output "pas_3_subnet_cidrs" {
  value = ["${google_compute_subnetwork.pas-3-subnet.ip_cidr_range}"]
}

output "pas_3_subnet_name" {
  value = "${google_compute_subnetwork.pas-3-subnet.name}"
}

output "pas_subnets" {
  value = ["${google_compute_subnetwork.pas-1-subnet.name}","${google_compute_subnetwork.pas-2-subnet.name}","${google_compute_subnetwork.pas-3-subnet.name}"]
}

output "services_1_subnet_gateway" {
  value = "${google_compute_subnetwork.services-1-subnet.gateway_address}"
}

output "services_1_subnet_cidrs" {
  value = ["${google_compute_subnetwork.services-1-subnet.ip_cidr_range}"]
}

output "services_1_subnet_name" {
  value = "${google_compute_subnetwork.services-1-subnet.name}"
}

output "services_2_subnet_gateway" {
  value = "${google_compute_subnetwork.services-2-subnet.gateway_address}"
}

output "services_2_subnet_cidrs" {
  value = ["${google_compute_subnetwork.services-2-subnet.ip_cidr_range}"]
}

output "services_2_subnet_name" {
  value = "${google_compute_subnetwork.services-2-subnet.name}"
}

output "services_3_subnet_gateway" {
  value = "${google_compute_subnetwork.services-3-subnet.gateway_address}"
}

output "services_3_subnet_cidrs" {
  value = ["${google_compute_subnetwork.services-3-subnet.ip_cidr_range}"]
}

output "services_3_subnet_name" {
  value = "${google_compute_subnetwork.services-3-subnet.name}"
}

output "services_subnets" {
  value = ["${google_compute_subnetwork.services-1-subnet.name}","${google_compute_subnetwork.services-2-subnet.name}","${google_compute_subnetwork.services-3-subnet.name}"]
}
