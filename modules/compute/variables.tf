variable "project" {
  type = "string"
}

variable "env_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "opsman_service_account_email" {
  type="string"
}

variable "zones" {
  type = "list"
}

variable "opsman_image_url" {
  type        = "string"
  description = "Location of ops manager image on google cloud storage"
}

variable "opsman_machine_type" {
  type    = "string"
  default = "n1-standard-2"
}

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

variable "pas_1_cidr" {
  type        = "string"
  description = "cidr for pas subnet on zone 1"
  default     = "10.119.50.0/25"
}

variable "internetless" {
  description = "When set to true, all traffic going outside the 10.* network is denied."
  default     = true
}
