output "iaas" {
  value = "gcp"
}

output "project" {
  value = "${module.iam.project}"
}

output "region" {
  value = "${module.iam.region}"
}

output "azs" {
  value = "${var.zones}"
}

output "service_account_email" {
  value = "${module.iam.service_account_email}"
}

output "pas_blobstore_gcp_service_account_key" {
  value = "${module.iam.pas_blobstore_gcp_service_account_key}"
}

output "pas_blobstore_service_account_email" {
  value = "${module.iam.pas_blobstore_service_account_email}"
}

output "pas_blobstore_service_account_project" {
  value = "${module.iam.pas_blobstore_service_account_project}"
}

output "buildpacks_bucket" {
  value = "${module.storage.buildpacks_bucket}"
}

output "droplets_bucket" {
  value = "${module.storage.droplets_bucket}"
}

output "packages_bucket" {
  value = "${module.storage.packages_bucket}"
}

output "resources_bucket" {
  value = "${module.storage.resources_bucket}"
}

output "director_blobstore_bucket" {
  value = "${module.storage.director_blobstore_bucket}"
}

output "network_name" {
  value = "${module.network.network_name}"
}

output "management_subnet_1_gateway" {
  value = "${module.network.management_subnet_1_gateway}"
}

output "management_1_subnet_cidrs" {
  value = "${module.network.management_1_subnet_cidrs}"
}

output "management_1_subnet_name" {
  value = "${module.network.management_1_subnet_name}"
}

output "management_subnet_2_gateway" {
  value = "${module.network.management_subnet_2_gateway}"
}

output "management_2_subnet_cidrs" {
  value = "${module.network.management_2_subnet_cidrs}"
}

output "management_2_subnet_name" {
  value = "${module.network.management_2_subnet_name}"
}

output "management_subnet_3_gateway" {
  value = "${module.network.management_subnet_3_gateway}"
}

output "management_3_subnet_cidrs" {
  value = "${module.network.management_3_subnet_cidrs}"
}

output "management_3_subnet_name" {
  value = "${module.network.management_3_subnet_name}"
}

output "management_subnets" {
  value = "${module.network.management_subnets}"
}

output "pas_1_subnet_gateway" {
  value = "${module.network.pas_1_subnet_gateway}"
}

output "pas_1_subnet_cidrs" {
  value = "${module.network.pas_1_subnet_cidrs}"
}

output "pas_1_subnet_name" {
  value = "${module.network.pas_1_subnet_name}"
}

output "pas_2_subnet_gateway" {
  value = "${module.network.pas_2_subnet_gateway}"
}

output "pas_2_subnet_cidrs" {
  value = "${module.network.pas_2_subnet_cidrs}"
}

output "pas_2_subnet_name" {
  value = "${module.network.pas_2_subnet_name}"
}

output "pas_3_subnet_gateway" {
  value = "${module.network.pas_3_subnet_gateway}"
}

output "pas_3_subnet_cidrs" {
  value = "${module.network.pas_3_subnet_cidrs}"
}

output "pas_3_subnet_name" {
  value = "${module.network.pas_3_subnet_name}"
}

output "pas_subnets" {
  value = "${module.network.pas_subnets}"
}

output "services_1_subnet_gateway" {
  value = "${module.network.services_1_subnet_gateway}"
}

output "services_1_subnet_cidrs" {
  value = "${module.network.services_1_subnet_cidrs}"
}

output "services_1_subnet_name" {
  value = "${module.network.services_1_subnet_name}"
}

output "services_2_subnet_gateway" {
  value = "${module.network.services_2_subnet_gateway}"
}

output "services_2_subnet_cidrs" {
  value = "${module.network.services_2_subnet_cidrs}"
}

output "services_2_subnet_name" {
  value = "${module.network.services_2_subnet_name}"
}

output "services_3_subnet_gateway" {
  value = "${module.network.services_2_subnet_gateway}"
}

output "services_3_subnet_cidrs" {
  value = "${module.network.services_3_subnet_cidrs}"
}

output "services_3_subnet_name" {
  value = "${module.network.services_3_subnet_name}"
}

output "services_subnets" {
  value = "${module.network.services_subnets}"
}

output "vm_tag" {
  value = "${module.compute.vm_tag}"
}

output "web_lb_name" {
  value = "${module.compute.web_lb_name}"
}

output "http_lb_backend_name" {
  value = "${module.compute.http_lb_backend_name}"
}

output "ssl_cert" {
  sensitive = true
  value     = "${module.compute.ssl_cert}"
}

output "ssl_private_key" {
  sensitive = true
  value     = "${module.compute.ssl_private_key}"
}

output "ssh_lb_name" {
  value = "${module.compute.ssh_lb_name}"
}

output "ssh_router_pool" {
  value = "${module.compute.ssh_router_pool}"
}

output "ops_manager_ssh_private_key" {
  sensitive = true
  value     = "${module.compute.ops_manager_ssh_private_key}"
}

output "ops_manager_ssh_public_key" {
  sensitive = true
  value     = "${module.compute.ops_manager_ssh_public_key}"
}
