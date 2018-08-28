output "iaas" {
  value = "gcp"
}

output "project" {
  value = "${var.project}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.zones}"
}

output "vm_tag" {
  value = "${var.env_name}-vms"
}

locals {
  lb_name           = "${var.global_lb > 0 ? element(concat(google_compute_backend_service.http_lb_backend_service.*.name, list("")), 0) : element(concat(google_compute_target_pool.cf.*.name, list("")), 0)}"
  haproxy_static_ip = "${cidrhost(var.pas_1_cidr, -20)}"
  cf_address        = "${var.global_lb > 0 ? element(concat(google_compute_global_address.cf.*.address, list("")), 0) : element(concat(google_compute_address.cf.*.address, list("")), 0)}"
}

output "web_lb_name" {
  value = "${local.lb_name}"
}

output "http_lb_backend_name" {
  value = "${local.lb_name}"
}

output "ssl_cert" {
  sensitive = true
  value     = "${var.ssl_cert}"
}

output "ssl_private_key" {
  sensitive = true
  value     = "${var.ssl_private_key}"
}

output "ssh_lb_name" {
  value = "${google_compute_target_pool.cf-ssh.name}"
}

output "ssh_router_pool" {
  value = "${google_compute_target_pool.cf-ssh.name}"
}

output "ops_manager_ssh_private_key" {
  sensitive = true
  value     = "${tls_private_key.ops-manager.private_key_pem}"
}

output "ops_manager_ssh_public_key" {
  sensitive = true
  value     = "${format("ubuntu:%s", tls_private_key.ops-manager.public_key_openssh)}"
}

output "pcf.domainName" {
  //value     = "${google_compute_address.ops-manager-ip.address}"
  value     = "${google_compute_instance.ops-manager.network_interface.0.address}"
}

output "wildcard.sys.domainName" {
  value     = "${var.internetless ? local.haproxy_static_ip : local.cf_address}"
}

output "wildcard.apps.domainName" {
  value     = "${var.internetless ? local.haproxy_static_ip : local.cf_address}"
}

output "ssh.sys.domainName" {
  value     = "${var.internetless ? local.haproxy_static_ip : google_compute_address.cf-ssh.address}"
}
