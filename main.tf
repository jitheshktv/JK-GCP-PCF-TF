module "iam" {
  source = "./modules/iam"


  env_name    = "${var.env_name}"
  region      = "${var.region}"
  project     = "${var.project}"
  service_account_key = "${var.service_account_key}"
  create_iam_service_account_members = "${var.create_iam_service_account_members}"
  create_blobstore_service_account_key = "${var.create_blobstore_service_account_key}"
}

module "storage" {
  source = "./modules/storage"

  env_name    = "${var.env_name}"
  region      = "${var.region}"
  project     = "${var.project}"

}

module "network" {
  source = "./modules/network"

  env_name    = "${var.env_name}"
  network_name = "${var.network_name}"
  region      = "${var.region}"
  management_1_cidr = "${var.management_1_cidr}"
  management_2_cidr = "${var.management_2_cidr}"
  management_3_cidr = "${var.management_3_cidr}"
  pas_1_cidr = "${var.pas_1_cidr}"
  pas_2_cidr = "${var.pas_2_cidr}"
  pas_3_cidr = "${var.pas_3_cidr}"
  services_1_cidr = "${var.services_1_cidr}"
  services_2_cidr = "${var.services_2_cidr}"
  services_3_cidr = "${var.services_3_cidr}"
}

module "security" {
  source = "./modules/security"

  env_name    = "${var.env_name}"
  network_name = "${var.network_name}"
  management_1_cidr = "${var.management_1_cidr}"
  management_2_cidr = "${var.management_2_cidr}"
  management_3_cidr = "${var.management_3_cidr}"
  pas_1_cidr = "${var.pas_1_cidr}"
  pas_2_cidr = "${var.pas_2_cidr}"
  pas_3_cidr = "${var.pas_3_cidr}"
  services_1_cidr = "${var.services_1_cidr}"
  services_2_cidr = "${var.services_2_cidr}"
  services_3_cidr = "${var.services_3_cidr}"
  internetless = "${var.internetless}"
  opsman_service_account_email = "${module.iam.service_account_email}"
}

module "compute" {
  source = "./modules/compute"

  env_name    = "${var.env_name}"
  region      = "${var.region}"
  project     = "${var.project}"
  zones	      = "${var.zones}"
  opsman_service_account_email = "${module.iam.service_account_email}"
  opsman_image_url = "${var.opsman_image_url}"
  opsman_machine_type = "${var.opsman_machine_type}"
  ssl_cert = "${var.ssl_cert}"
  ssl_private_key = "${var.ssl_private_key}"
}
