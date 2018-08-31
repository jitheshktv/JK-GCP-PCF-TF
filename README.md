# How Does One Use This?

checkout the project. Edit terraform.tfvars file with your project specefic variables. Edit the variables.tf with your requirement specefic variables values and execute the terraform template. You will also need a file with the "service_account_key" which you need to pass as a "-var-file" or append it to the terraform.tfvars file.

## What Does This Do?

You will get a booted ops-manager VM plus some networking, just the bare bones basically.

## Prerequisites

Your system needs the `gcloud` cli, as well as `terraform`:

```bash
brew update
brew install Caskroom/cask/google-cloud-sdk
brew install terraform
```

## Notes

You will need a key file for your [service account](https://cloud.google.com/iam/docs/service-accounts)
to allow terraform to deploy resources. If you don't have one, you can create a service account and a key for it:

```bash
gcloud iam service-accounts create ACCOUNT_NAME --display-name "Some Account Name"
gcloud iam service-accounts keys create "terraform.key.json" --iam-account "ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding PROJECT_ID --member 'serviceAccount:ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com' --role 'roles/owner'
```

You will need to enable the following Google Cloud APIs:
- [Identity and Access Management](https://console.developers.google.com/apis/api/iam.googleapis.com)
- [Cloud Resource Manager](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/)
- [Cloud DNS](https://console.developers.google.com/apis/api/dns/overview)
- [Cloud SQL API](https://console.developers.google.com/apis/api/sqladmin/overview)

Edit the variables.tf and terraform.tfvars file as needed.

### Var Details
- env\_name: **(required)** An arbitrary unique name for namespacing resources. Max 23 characters.
- project: **(required)** ID for your GCP project.
- region: **(required)** Region in which to create resources (e.g. us-central1)
- zones: **(required)** Zones in which to create resources. Must be within the given region. Currently you must specify exactly 3 Zones for this terraform configuration to work. (e.g. [us-central1-a, us-central1-b, us-central1-c])
- opsman\_image\_url **(required)** Source URL of the Ops Manager image you want to boot.
- service\_account\_key: **(required)** Contents of your service account key file generated using the `gcloud iam service-accounts keys create` command.
- dns\_suffix: **(required)** Domain to add environment subdomain to (e.g. foo.example.com)
- buckets\_location: **(optional)** Loction in which to create buckets. Defaults to US.
- ssl\_cert: **(optional)** SSL certificate for HTTP load balancer configuration. Required unless `ssl_ca_cert` is specified.
- ssl\_private\_key: **(optional)** Private key for above SSL certificate. Required unless `ssl_ca_cert` is specified.
- ssl\_ca\_cert: **(optional)** SSL CA certificate used to generate self-signed HTTP load balancer certificate. Required unless `ssl_cert` is specified.
- ssl\_ca\_private\_key: **(optional)** Private key for above SSL CA certificate. Required unless `ssl_cert` is specified.
- opsman\_storage\_bucket\_count: **(optional)** Google Storage Bucket for BOSH's Blobstore.
- create\_iam\_service\_account\_members: **(optional)** Create IAM Service Account project roles. Default to true.

## DNS Records
- pcf.*$env_name*.*$dns_suffix*: Points at the Ops Manager VM's public IP address.
- \*.sys.*$env_name*.*$dns_suffix*: Points at the HTTP/S load balancer in front of the Router.
- doppler.sys.*$env_name*.*$dns_suffix*: Points at the TCP load balancer in front of the Router. This address is used to send websocket traffic to the Doppler server.
- loggregator.sys.*$env_name*.*$dns_suffix*: Points at the TCP load balancer in front of the Router. This address is used to send websocket traffic to the Loggregator Trafficcontroller.
- \*.apps.*$env_name*.*$dns_suffix*: Points at the HTTP/S load balancer in front of the Router.
- \*.ws.*$env_name*.*$dns_suffix*: Points at the TCP load balancer in front of the Router. This address can be used for application websocket traffic.
- ssh.sys.*$env_name*.*$dns_suffix*: Points at the TCP load balancer in front of the Diego brain.
- tcp.*$env_name*.*$dns_suffix*: Points at the TCP load balancer in front of the TCP router.

## Cloud SQL Configuration (optional)
- external\_database: **(optional)** When set to "true", a cloud SQL instance will be deployed for the Ops Manager and PAS.

## Ops Manager (optional)
- opsman\_sql\_db\_host: **(optional)** The host the user can connect from. Can be an IP address. Changing this forces a new resource to be created.

## PAS (optional)
- pas\_sql\_db\_host: **(optional)** The host the user can connect from. Can be an IP address. Changing this forces a new resource to be created.

## PAS Cloud Controller's Google Cloud Storage Buckets (optional)
- create\_gcs\_buckets: **(optional)** When set to "false", buckets will not be created for PAS Cloud Controller. Defaults to "true".

## Internetless (optional)
- internetless: **(optional)** Set to "true",for locked down environments.

## global_lb (optional)
- global_ip: Use global load balancers for CF instead of regional load balancers. Set this to "0" for internetless.

## Running

Note: please make sure you have created the `terraform.tfvars` file above as mentioned.

### Standing up environment

```bash
terraform init
terraform plan -out=plan
terraform apply plan
```

### Tearing down environment

```bash
terraform destroy
```
