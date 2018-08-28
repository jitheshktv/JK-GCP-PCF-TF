variable "project" {
  type = "string"
}

variable "env_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "zones" {
  type = "list"
}

variable "service_account_key" {
  type = "string"
}

variable "create_iam_service_account_members" {
  description = "If set to true, create an IAM Service Account project roles"
  default     = true
}

variable "create_blobstore_service_account_key" {
  description = "Create a scoped service account key for gcs storage access"
  default     = true
}

variable "buckets_location" {
  type    = "string"
  default = "US"
}

/******************
 * OpsMan Options *
 ******************/

variable "opsman_storage_bucket_count" {
  type        = "string"
  description = "Optional configuration of a Google Storage Bucket for BOSH's blobstore"
  default     = "1"
}

variable "opsman_image_url" {
  type        = "string"
  description = "Location of ops manager image on google cloud storage"
}

variable "opsman_machine_type" {
  type    = "string"
  default = "n1-standard-2"
}

/********************************
 * Google Cloud Storage Options *
 ********************************/

variable "create_gcs_buckets" {
  description = "Create Google Storage Buckets for Elastic Runtime Cloud Controller's file storage"
  default     = true
}

/********************************
 * Network and subnet CIDRs *
 ********************************/

variable "network_name" {
  type = "string"
  default = "pcf-network"
}

variable "management_1_cidr" {
  type        = "string"
  description = "cidr for management subnet on zone 1"
  default     = "10.119.51.128/28"
}

variable "management_2_cidr" {
  type        = "string"
  description = "cidr for management subnet on zone 2"
  default     = "10.119.51.144/28"
}

variable "management_3_cidr" {
  type        = "string"
  description = "cidr for management subnet on zone 3"
  default     = "10.119.51.160/28"
}

variable "pas_1_cidr" {
  type        = "string"
  description = "cidr for pas subnet on zone 1"
  default     = "10.119.50.0/25"
}

variable "pas_2_cidr" {
  type        = "string"
  description = "cidr for pas subnet on zone 2"
  default     = "10.119.50.128/25"
}

variable "pas_3_cidr" {
  type        = "string"
  description = "cidr for pas subnet on zone 3"
  default     = "10.119.51.0/25"
}

variable "services_1_cidr" {
  type        = "string"
  description = "cidr for services subnet on zone 1"
  default     = "10.119.51.176/28"
}

variable "services_2_cidr" {
  type        = "string"
  description = "cidr for services subnet on zone 2"
  default     = "10.119.51.192/28"
}

variable "services_3_cidr" {
  type        = "string"
  description = "cidr for services subnet on zone 3"
  default     = "10.119.51.208/28"
}

/********************************
 * Internetless *
 ********************************/

variable "internetless" {
  description = "When set to true, all traffic going outside the 10.* network is denied."
  default     = true
}

variable "global_lb" {
  description = "Use global load balancers for CF instead of regional load balancers"
  default     = 0
}

/********************************
 * certificate for Load Balancer *
 ********************************/


variable "ssl_cert" {
  type        = "string"
  description = "The contents of an SSL certificate to be used by the LB, optional if `ssl_ca_cert` is provided"
  default     = ""
}

variable "ssl_private_key" {
  type        = "string"
  description = "The contents of an SSL private key to be used by the LB, optional if `ssl_ca_cert` is provided"
  default     = ""
}
