variable "env_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "network_name" {
  type= "string"
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
