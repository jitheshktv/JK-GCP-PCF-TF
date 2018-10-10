/**********
 * PAS LB *
 **********/

 resource "google_compute_address" "cf" {
   name         = "${var.env_name}-cf"
   address_type = "INTERNAL"
   subnetwork   = "${var.management_subnet_1_name}"
 }

 resource "google_compute_instance_group" "pas_lb" {
   // Count based on number of AZs
   count       = 3
   name        = "${var.env_name}-httpslb-${element(var.zones, count.index)}"
   description = "terraform generated instance group that is multi-zone for loadbalancing"
   zone        = "${element(var.zones, count.index)}"
   network     = "${var.network_name}"
 }

 resource "google_compute_health_check" "pas_lb_healthcheck" {
   name                = "${var.env_name}-paslb-healthcheck"
   check_interval_sec  = 5
   timeout_sec         = 3
   healthy_threshold   = 6
   unhealthy_threshold = 3
   tcp_health_check {
     port           = 8080
   }
 }

 resource "google_compute_region_backend_service" "pas_lb_backend_service" {
   name        = "${var.env_name}-pas-lb-backend-svc"
   protocol    = "TCP"
   timeout_sec = 900

   backend {
     group = "${google_compute_instance_group.pas_lb.0.self_link}"
   }

   backend {
     group = "${google_compute_instance_group.pas_lb.1.self_link}"
   }

   backend {
     group = "${google_compute_instance_group.pas_lb.2.self_link}"
   }

   health_checks = ["${google_compute_health_check.pas_lb_healthcheck.self_link}"]
 }

 resource "google_compute_ssl_certificate" "cert" {
   name_prefix = "${var.env_name}-lbcert-"
   description = "user provided ssl private key / ssl certificate pair"
   certificate = "${var.ssl_cert}"
   private_key = "${var.ssl_private_key}"

   lifecycle   = {
     create_before_destroy = true
   }
 }

 resource "google_compute_forwarding_rule" "cf-http" {
   name                   = "${var.env_name}-cf-lb-http"
   load_balancing_scheme  = "INTERNAL"
   ip_address             = "${google_compute_address.cf.address}"
   network                = "${var.network_name}"
   subnetwork             = "${var.management_subnet_1_name}"
   backend_service        = "${google_compute_region_backend_service.pas_lb_backend_service.self_link}"
   port_range             = "80"
   ip_protocol            = "TCP"
 }

 resource "google_compute_forwarding_rule" "cf-https" {
   name                   = "${var.env_name}-cf-lb-https"
   load_balancing_scheme  = "INTERNAL"
   ip_address             = "${google_compute_address.cf.address}"
   network                = "${var.network_name}"
   subnetwork             = "${var.management_subnet_1_name}"
   backend_service        = "${google_compute_region_backend_service.pas_lb_backend_service.self_link}"
   port_range             = "443"
   ip_protocol            = "TCP"
 }

/****************
 * Diego SSH LB *
 ****************/

resource "google_compute_address" "cf-ssh" {
  name = "${var.env_name}-cf-ssh"
  //address_type = "INTERNAL"
}

resource "google_compute_target_pool" "cf-ssh" {
  name = "${var.env_name}-cf-ssh"
}

resource "google_compute_forwarding_rule" "cf-ssh" {
  name        = "${var.env_name}-cf-ssh"
  target      = "${google_compute_target_pool.cf-ssh.self_link}"
  port_range  = "2222"
  ip_protocol = "TCP"
  ip_address  = "${google_compute_address.cf-ssh.address}"
}
