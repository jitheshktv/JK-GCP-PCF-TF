output "iaas" {
  value = "gcp"
}

output "project" {
  value = "${var.project}"
}

output "region" {
  value = "${var.region}"
}

output "service_account_email" {
  value = "${google_service_account.opsman_service_account.email}"
}

output "pas_blobstore_gcp_service_account_key" {
  value     = "${base64decode(element(concat(google_service_account_key.blobstore_service_account_key.*.private_key, list("")), 0))}"
  sensitive = true
}

output "pas_blobstore_service_account_email" {
  value = "${element(concat(google_service_account.blobstore_service_account.*.email, list("")), 0)}"
}

output "pas_blobstore_service_account_project" {
  value = "${element(concat(google_service_account.blobstore_service_account.*.project, list("")), 0)}"
}

