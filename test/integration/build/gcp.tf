terraform {
  required_version = "~> 0.11.5"
}

# GCP Terraform Templates For Inspec Testing
#
# Starts off with 'generic' resource descriptions, mostly taken from here:
# https://www.terraform.io/docs/providers/google/
# Then moves onto a more 'realistic' example adapted from
# https://github.com/GoogleCloudPlatform/terraform-google-lb-internal/tree/master/examples/simple


# Configure variables

variable "gcp_project_name" {}
variable "gcp_project_id" {}
variable "gcp_project_number" {}

variable "gcp_location" {
  default = "europe-west2"
}

variable "gcp_zone" {
  default = "europe-west2-a"
}

variable "gcp_int_vm_name" {}

variable "gcp_int_vm_size" {
  default = "f1-micro"
}

variable "gcp_int_vm_image" {
  default = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "gcp_ext_vm_name" {}
variable "gcp_ext_vm_size" {}
variable "gcp_ext_vm_image" {}
variable "gcp_ext_compute_address_name" {}
variable "gcp_windows_int_vm_name" {}
variable "gcp_windows_int_vm_size" {}
variable "gcp_windows_int_vm_image" {}
variable "gcp_service_account_display_name" {}
variable "gcp_project_iam_custom_role_id" {}

variable "gcp_compute_disk_name" {}
variable "gcp_compute_disk_type" {}
variable "gcp_compute_disk_image" {}

variable "gcp_ext_vm_data_disk_address_name" {}
variable "gcp_ext_vm_data_disk_name" {}
variable "gcp_ext_vm_data_disk_size" {}
variable "gcp_ext_vm_data_disk_image" {}

variable "gcp_kube_cluster_name" {}
variable "gcp_kube_cluster_zone" {}
variable "gcp_kube_cluster_size" {}
variable "gcp_kube_cluster_zone_extra1" {}
variable "gcp_kube_cluster_zone_extra2" {}
variable "gcp_kube_cluster_master_user" {}
variable "gcp_kube_cluster_master_pass" {}

variable "gcp_kms_key_ring_policy_name" {}
variable "gcp_kms_key_ring_binding_member_name" {}
variable "gcp_kms_crypto_key_name_policy" {}
variable "gcp_kms_crypto_key_name_binding" {}

variable "gcp_storage_bucket_name" {}
variable "gcp_storage_bucket_acl" {}
variable "gcp_storage_bucket_binding" {}
variable "gcp_storage_bucket_member" {}
variable "gcp_storage_bucket_policy" {}
variable "gcp_storage_bucket_object" {}
variable "gcp_storage_bucket_object_name" {}

variable "gcp_logging_vm_name" {}
variable "gcp_logging_bucket_name" {}
variable "gcp_logging_project_sink_name" {}
variable "gcp_logging_project_exclusion_name" {}

variable "gcp_network_name" {}
variable "gcp_subnetwork_name" {}
variable "gcp_vpn_gateway_name" {}
variable "gcp_vpn_tunnel_name" {}
variable "gcp_fr_esp_name" {}
variable "gcp_fr_udp_name" {}
variable "gcp_address_name" {}
variable "gcp_vpn_address_name" {}

variable "gcp_db_instance_name" {}
variable "gcp_db_name" {}
variable "gcp_db_type" {}
variable "gcp_db_size" {}
variable "gcp_db_user_name" {}
variable "gcp_db_user_password" {}

variable "gcp_enable_privileged_resources" {}

provider "google" {
  region = "${var.gcp_location}",
  version = "~> 1.16"
}

resource "google_service_account" "generic_service_account_object_viewer" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  account_id   = "${var.gcp_service_account_display_name}"
  display_name = "${var.gcp_service_account_display_name}"
}

resource "google_compute_instance" "generic_internal_vm_instance" {
  project = "${var.gcp_project_id}"
  name         = "${var.gcp_int_vm_name}"
  machine_type = "${var.gcp_int_vm_size}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_int_vm_image}"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_address" "generic_external_vm_address" {
  project = "${var.gcp_project_id}"
  name = "${var.gcp_ext_compute_address_name}"
  region = "${var.gcp_location}"
}

resource "google_compute_instance" "generic_external_vm_instance" {
  project = "${var.gcp_project_id}"
  name         = "${var.gcp_ext_vm_name}"
  machine_type = "${var.gcp_ext_vm_size}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_ext_vm_image}"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
      nat_ip = "${google_compute_address.generic_external_vm_address.address}"
    }
  }
}

resource "google_compute_instance" "generic_windows_internal_vm_instance" {
  project = "${var.gcp_project_id}"
  name         = "${var.gcp_windows_int_vm_name}"
  machine_type = "${var.gcp_windows_int_vm_size}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_windows_int_vm_image}"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_project_iam_custom_role" "generic_project_iam_custom_role" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  role_id     = "${var.gcp_project_iam_custom_role_id}"
  title       = "GCP Inspec Generic Project IAM Custom Role"
  description = "Custom role allowing to list IAM roles only"
  permissions = ["iam.roles.list"]
}

resource "google_compute_disk" "generic_compute_disk" {
  project = "${var.gcp_project_id}"
  name  = "${var.gcp_compute_disk_name}"
  type  = "${var.gcp_compute_disk_type}"
  zone  = "${var.gcp_zone}"
  image = "${var.gcp_compute_disk_image}"
  labels {
    environment = "generic_compute_disk_label"
  }
}

resource "google_compute_address" "generic_external_vm_address_data_disk" {
  project = "${var.gcp_project_id}"
  name = "${var.gcp_ext_vm_data_disk_address_name}"
  region = "${var.gcp_location}"
}

resource "google_compute_instance" "generic_external_vm_instance_data_disk" {
  project = "${var.gcp_project_id}"
  name         = "${var.gcp_ext_vm_data_disk_name}"
  machine_type = "${var.gcp_ext_vm_data_disk_size}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_ext_vm_data_disk_image}"
    }
  }

  attached_disk {
    source = "${var.gcp_compute_disk_name}"
    mode = "READ_WRITE"
    device_name = "${var.gcp_compute_disk_name}"
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
      nat_ip = "${google_compute_address.generic_external_vm_address_data_disk.address}"
    }
  }
}

##############################################################
# The adapted google lb example starts from this point onwards
##############################################################

#Internal Load Balancer Example
#
#This example creates 3 instance groups. The first group uses the internal load balancer to proxy access to
#services running in instance groups 2 and 3 which exist in separate zones. A regional TCP load balancer is also
#used to forward external traffic to the instances in group 1.

# adapted from https://github.com/GoogleCloudPlatform/terraform-google-lb-internal/blob/master/examples/simple/main.tf

variable gcp_lb_region {
  default = "europe-west2"
}

variable gcp_lb_network {
  default = "default"
}

variable gcp_lb_zone {
  default = "europe-west2-a"
}

variable gcp_lb_zone_mig2 {
  default = "europe-west2-b"
}

variable gcp_lb_zone_mig3 {
  default = "europe-west2-c"
}

variable gcp_lb_fr_name {
  default = "group1-lb"
}

variable gcp_lb_ilb_name {
  default = "group1-ilb"
}

module "gce_lb_fr" {
  project = "${var.gcp_project_id}"
  source       = "github.com/GoogleCloudPlatform/terraform-google-lb?ref=1.0.2"
  region       = "${var.gcp_lb_region}"
  network      = "${var.gcp_lb_network}"
  name         = "${var.gcp_lb_fr_name}"
  service_port = "${module.mig1.service_port}"
  target_tags  = ["${module.mig1.target_tags}"]
}

module "gce_ilb" {
  project = "${var.gcp_project_id}"
  source      = "github.com/GoogleCloudPlatform/terraform-google-lb-internal?ref=1.0.4"
  region      = "${var.gcp_lb_region}"
  name        = "${var.gcp_lb_ilb_name}"
  ports       = ["${module.mig2.service_port}"]
  health_port = "${module.mig2.service_port}"
  source_tags = ["${module.mig1.target_tags}"]
  target_tags = ["${module.mig2.target_tags}", "${module.mig3.target_tags}"]

  backends = [
    {
      group = "${module.mig2.instance_group}"
    },
    {
      group = "${module.mig3.instance_group}"
    },
  ]
}

# adapted from https://github.com/GoogleCloudPlatform/terraform-google-lb-internal/blob/master/examples/simple/mig.tf

variable gcp_lb_mig1_name {
  default = "group1"
}

variable gcp_lb_mig2_name {
  default = "group2"
}

variable gcp_lb_mig3_name {
  default = "group3"
}


data "template_file" "group1-startup-script" {
  template = "${file("${format("%s/templates/nginx_upstream.sh.tpl", path.module)}")}"

  vars {
    UPSTREAM = "${module.gce_ilb.ip_address}"
  }
}

data "template_file" "group2-startup-script" {
  template = "${file("${format("%s/templates/gceme.sh.tpl", path.module)}")}"

  vars {
    PROXY_PATH = ""
  }
}

data "template_file" "group3-startup-script" {
  template = "${file("${format("%s/templates/gceme.sh.tpl", path.module)}")}"

  vars {
    PROXY_PATH = ""
  }
}

module "mig1" {
  project = "${var.gcp_project_id}"
  source            = "github.com/GoogleCloudPlatform/terraform-google-managed-instance-group?ref=1.1.13"
  region            = "${var.gcp_lb_region}"
  zone              = "${var.gcp_lb_zone}"
  name              = "${var.gcp_lb_mig1_name}"
  size              = 2
  target_tags       = ["allow-${var.gcp_lb_mig1_name}"]
  target_pools      = ["${module.gce_lb_fr.target_pool}"]
  service_port      = 80
  service_port_name = "http"
  startup_script    = "${data.template_file.group1-startup-script.rendered}"
}

module "mig2" {
  project = "${var.gcp_project_id}"
  source            = "github.com/GoogleCloudPlatform/terraform-google-managed-instance-group?ref=1.1.13"
  region            = "${var.gcp_lb_region}"
  zone              = "${var.gcp_lb_zone_mig2}"
  name              = "${var.gcp_lb_mig2_name}"
  size              = 2
  target_tags       = ["allow-${var.gcp_lb_mig2_name}"]
  service_port      = 80
  service_port_name = "http"
  startup_script    = "${data.template_file.group2-startup-script.rendered}"
}

module "mig3" {
  project = "${var.gcp_project_id}"
  source            = "github.com/GoogleCloudPlatform/terraform-google-managed-instance-group?ref=1.1.13"
  region            = "${var.gcp_lb_region}"
  zone              = "${var.gcp_lb_zone_mig3}"
  name              = "${var.gcp_lb_mig3_name}"
  size              = 2
  target_tags       = ["allow-${var.gcp_lb_mig3_name}"]
  service_port      = 80
  service_port_name = "http"
  startup_script    = "${data.template_file.group3-startup-script.rendered}"
}


resource "google_compute_instance_template" "default" {
  project      = "${var.gcp_project_id}"
  name         = "${var.gcp_lb_mig1_name}-itpl"
  machine_type = "f1-micro"
  network_interface {
    network = "default"
  }
  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    boot         = true
  }
}

resource "google_compute_region_instance_group_manager" "appserver" {
  project           = "${var.gcp_project_id}"
  name              = "${var.gcp_lb_mig1_name}-rigm"
  instance_template = "${google_compute_instance_template.default.self_link}"
  base_instance_name        = "app"
  region                    = "${var.gcp_lb_region}"
  distribution_policy_zones = ["${var.gcp_lb_zone}", "${var.gcp_lb_zone_mig2}"]
  target_pools = []
  target_size  = 0
  named_port {
    name = "custom"
    port = 80
  }
}

# after a successful apply, open URL of load balancer in browser:
# > EXTERNAL_IP=$(terraform output -module gce-lb-fr | grep external_ip | cut -d = -f2 | xargs echo -n)
# > open http://${EXTERNAL_IP}

##############################################################
# End of the google lb example adapted template.
##############################################################

##############################################################
# Start of the GKE cluster example
##############################################################

resource "google_container_cluster" "primary" {
  project = "${var.gcp_project_id}"
  name               = "${var.gcp_kube_cluster_name}"
  zone               = "${var.gcp_kube_cluster_zone}"
  initial_node_count = "${var.gcp_kube_cluster_size}"

  additional_zones = [
    "${var.gcp_kube_cluster_zone_extra1}",
    "${var.gcp_kube_cluster_zone_extra2}",
  ]

  master_auth {
    username = "${var.gcp_kube_cluster_master_user}"
    password = "${var.gcp_kube_cluster_master_pass}"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "23:00"
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

# Future work - as a more realistic example, could stand up another cluster and
# extend with the GKE NAT Gateway template:
# https://github.com/GoogleCloudPlatform/terraform-google-nat-gateway/tree/master/examples/gke-nat-gateway
# requires the master node IP and tag name which could be tough to get hold of

##############################################################
# End of the GKE cluster example
##############################################################

# Start GCP KMS resources
# This reuses service account email address that was created earlier to test IAM policies/binding/memberships

#Note: google_kms_key_ring_iam_policy cannot be used in conjunction with google_kms_key_ring_iam_binding and google_kms_key_ring_iam_member or they will fight over what your policy should be.

resource "google_kms_key_ring" "gcp_kms_key_ring_policy" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_kms_key_ring_policy_name}"
  location = "${var.gcp_location}"
}


#Note: google_kms_key_ring_iam_binding resources can be used in conjunction with google_kms_key_ring_iam_member resources only if they do not grant privilege to the same role.

resource "google_kms_key_ring" "gcp_kms_key_ring_binding_member" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_kms_key_ring_binding_member_name}"
  location = "${var.gcp_location}"
}

# Use the first key ring to attach an IAM policy

data "google_iam_policy" "gcp_inspec_admin_key_ring" {
  count = "${var.gcp_enable_privileged_resources}"
  binding {
    role = "roles/editor"

    members = [
      "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}",
    ]
  }
}

resource "google_kms_key_ring_iam_policy" "key_ring_policy" {
  count = "${var.gcp_enable_privileged_resources}"
  key_ring_id = "${google_kms_key_ring.gcp_kms_key_ring_policy.id}"
  policy_data = "${data.google_iam_policy.gcp_inspec_admin_key_ring.policy_data}"
}

# Use the second key ring to attach an IAM binding plus IAM member affecting different roles

resource "google_kms_key_ring_iam_binding" "key_ring_binding" {
  count = "${var.gcp_enable_privileged_resources}"
  key_ring_id = "${google_kms_key_ring.gcp_kms_key_ring_binding_member.id}"
  role        = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}",
  ]
}

resource "google_kms_key_ring_iam_member" "key_ring_iam_member" {
  count = "${var.gcp_enable_privileged_resources}"
  key_ring_id = "${google_kms_key_ring.gcp_kms_key_ring_binding_member.id}"
  role        = "roles/owner"
  member      = "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}"
}

resource "google_kms_crypto_key" "crypto_key_policy" {
  count = "${var.gcp_enable_privileged_resources}"
  name            = "${var.gcp_kms_crypto_key_name_policy}"
  key_ring        = "${google_kms_key_ring.gcp_kms_key_ring_policy.id}"
  rotation_period = "100000s"
}

resource "google_kms_crypto_key" "crypto_key_binding" {
  count = "${var.gcp_enable_privileged_resources}"
  name            = "${var.gcp_kms_crypto_key_name_binding}"
  key_ring        = "${google_kms_key_ring.gcp_kms_key_ring_binding_member.id}"
  rotation_period = "100000s"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_iam_member" {
  count = "${var.gcp_enable_privileged_resources}"
  crypto_key_id = "${google_kms_crypto_key.crypto_key_policy.id}"
  role          = "roles/editor"
  member      = "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}"
}

resource "google_kms_crypto_key_iam_binding" "crypto_key_iam_binding" {
  count = "${var.gcp_enable_privileged_resources}"
  crypto_key_id = "${google_kms_crypto_key.crypto_key_binding.id}"
  role          = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}",
  ]
}


# End GCP KMS resources

# Start storage bucket resources

resource "google_storage_bucket" "generic-storage-bucket" {
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_name}"
  location = "${var.gcp_location}"
}

# let's add a default ACL on the previous bucket
resource "google_storage_default_object_acl" "bucket-default-acl" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.generic-storage-bucket.name}"
  role_entity = [
    "OWNER:user-${google_service_account.generic_service_account_object_viewer.email}",
    "OWNER:project-owners-${var.gcp_project_number}",
  ]
}

# now test adding an ACL to a bucket

resource "google_storage_bucket" "bucket-with-acl" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_acl}"
  location = "${var.gcp_location}"
}

# make use of project convenience values as described here -  https://cloud.google.com/storage/docs/access-control/lists
resource "google_storage_bucket_acl" "bucket-acl" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.bucket-with-acl.name}"

  role_entity = [
    "OWNER:user-${google_service_account.generic_service_account_object_viewer.email}",
    "OWNER:project-owners-${var.gcp_project_number}",
  ]
}

# Note: google_storage_bucket_iam_binding resources can be used in conjunction with google_storage_bucket_iam_member resources only if they do not grant privilege to the same role.
# for simplicity here, create a bucket for iam binding and member cases

resource "google_storage_bucket" "bucket-with-iam-binding" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_binding}"
  location = "${var.gcp_location}"
}

resource "google_storage_bucket_iam_binding" "bucket-iam-binding" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.bucket-with-iam-binding.name}"
  role = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}",
  ]
}

resource "google_storage_bucket" "bucket-with-iam-member" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_member}"
  location = "${var.gcp_location}"
}

resource "google_storage_bucket_iam_member" "bucket-iam-member" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.bucket-with-iam-member.name}"
  role = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}"
}

# now for the IAM policy case

resource "google_storage_bucket" "bucket-with-iam-policy" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_policy}"
  location = "${var.gcp_location}"
}

data "google_iam_policy" "bucket-iam-policy" {
  count = "${var.gcp_enable_privileged_resources}"
  binding {
    role = "roles/storage.admin"

    members = [ "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}" ]
  }
}

resource "google_storage_bucket_iam_policy" "bucket-iam-policy-add" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.bucket-with-iam-policy.name}"
  policy_data = "${data.google_iam_policy.bucket-iam-policy.policy_data}"
}

# finally let's create a bucket with object plus an object ACL

resource "google_storage_bucket" "bucket-with-object" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_object}"
  location = "${var.gcp_location}"
}

resource "google_storage_bucket_object" "bucket-object" {
  count = "${var.gcp_enable_privileged_resources}"
  name   = "${var.gcp_storage_bucket_object_name}"
  bucket = "${google_storage_bucket.bucket-with-object.name}"
  content = "Bucket Object ${var.gcp_storage_bucket_object_name} for bucket ${var.gcp_storage_bucket_object} in ${var.gcp_project_id} with ACL."
}

#finally, add object ACL

resource "google_storage_object_acl" "bucket-object-acl" {
  count = "${var.gcp_enable_privileged_resources}"
  bucket = "${google_storage_bucket.bucket-with-object.name}"
  object = "${google_storage_bucket_object.bucket-object.name}"

  role_entity = [
    "OWNER:project-owners-${var.gcp_project_number}",
    "OWNER:user-${google_service_account.generic_service_account_object_viewer.email}",
  ]
}

# try the last scenario of adding an IAM policy to an object

# note at the time of writing, terraform isn't supporting the IAM policy applied to storage object case
# https://www.terraform.io/docs/providers/google/r/storage_bucket_object.html

# will revisit based on outcome of https://github.com/terraform-providers/terraform-provider-google/issues/1871

//resource "google_storage_bucket_object" "bucket-object-attach-policy" {
//  count = "${var.gcp_enable_privileged_resources}"
//  name   = "${var.gcp_storage_bucket_object_name}-iam"
//  bucket = "${google_storage_bucket.bucket-with-object.name}"
//  content = "Bucket Object ${var.gcp_storage_bucket_object_name} for bucket ${var.gcp_storage_bucket_object} in ${var.gcp_project_id} with IAM policy."
//}
//
//data "google_iam_policy" "object-iam-policy" {
//  count = "${var.gcp_enable_privileged_resources}"
//  binding {
//    role = "roles/storage.admin"
//
//    members = [ "serviceAccount:${google_service_account.generic_service_account_object_viewer.email}" ]
//  }
//}
//
//# would expect this to be something like below:
//resource "google_storage_object_iam_policy" "object-iam-policy-add" {
//  count = "${var.gcp_enable_privileged_resources}"
//  bucket = "${google_storage_bucket.bucket-with-object.name}"
//  object = "${google_storage_bucket_object.bucket-object-attach-policy.name}"
//  policy_data = "${data.google_iam_policy.object-iam-policy.policy_data}"
//}


# END storage bucket resources


# Start logging resources - initially for projects


resource "google_compute_instance" "vm-with-project-logging" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name         = "${var.gcp_logging_vm_name}"
  machine_type = "${var.gcp_int_vm_size}"
  zone         = "${var.gcp_zone}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_int_vm_image}"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_storage_bucket" "project-logging-bucket" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_logging_bucket_name}"
  location = "${var.gcp_location}"
}

resource "google_logging_project_sink" "project-logging-instance-sink" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name = "${var.gcp_logging_project_sink_name}"
  destination = "storage.googleapis.com/${google_storage_bucket.project-logging-bucket.name}"
  filter = "resource.type = gce_instance AND resource.labels.instance_id = \"${google_compute_instance.vm-with-project-logging.instance_id}\""

  unique_writer_identity = true
}

resource "google_project_iam_binding" "project-log-writer-iam-binding" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  role = "roles/storage.objectCreator"

  members = [
    "${google_logging_project_sink.project-logging-instance-sink.writer_identity}",
  ]
}

resource "google_logging_project_exclusion" "project-logging-exclusion" {
  count = "${var.gcp_enable_privileged_resources}"
  project = "${var.gcp_project_id}"
  name = "${var.gcp_logging_project_exclusion_name}"

  description = "Exclude GCE instance debug logs"

  # Exclude all DEBUG or lower severity messages relating to instances
  filter = "resource.type = gce_instance AND severity <= DEBUG"
}


# End logging resources

# Start network resources

resource "google_compute_network" "inspec-gcp-network" {
  project = "${var.gcp_project_id}"
  name                    =  "${var.gcp_network_name}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "inspec-gcp-subnetwork" {
  project = "${var.gcp_project_id}"
  ip_cidr_range = "10.2.0.0/29" # i.e. 8 total & 6 usable IPs
  name =  "${var.gcp_subnetwork_name}"
  region = "${var.gcp_location}"
  network = "${google_compute_network.inspec-gcp-network.self_link}"
}

resource "google_compute_vpn_gateway" "inspec-gcp-vpn-gateway" {
  name = "${var.gcp_vpn_gateway_name}"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"
  network = "${google_compute_network.inspec-gcp-network.self_link}"
}

resource "google_compute_address" "inspec-gcp-address" {
  name = "${var.gcp_address_name}"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"
}

resource "google_compute_address" "inspec-gcp-vpn-address" {
  name = "${var.gcp_vpn_address_name}"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"
}

resource "google_compute_forwarding_rule" "inspec-gcp-fr-esp" {
  name  = "${var.gcp_fr_esp_name}"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"

  ip_protocol = "ESP"
  ip_address = "${google_compute_address.inspec-gcp-vpn-address.address}"
  target = "${google_compute_vpn_gateway.inspec-gcp-vpn-gateway.self_link}"
}

resource "google_compute_forwarding_rule" "inspec-gcp-fr-udp500" {
  name    = "${var.gcp_fr_udp_name}-500"
  project = "${var.gcp_project_id}"
  region  = "${var.gcp_location}"

  ip_protocol = "UDP"
  port_range  = "500-500"
  ip_address  = "${google_compute_address.inspec-gcp-vpn-address.address}"
  target      = "${google_compute_vpn_gateway.inspec-gcp-vpn-gateway.self_link}"
}

resource "google_compute_forwarding_rule" "inspec-gcp-fr-udp4500" {
  name  = "${var.gcp_fr_udp_name}-4500"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"

  ip_protocol = "UDP"
  port_range = "4500-4500"
  ip_address = "${google_compute_address.inspec-gcp-vpn-address.address}"
  target = "${google_compute_vpn_gateway.inspec-gcp-vpn-gateway.self_link}"
}

resource "google_compute_vpn_tunnel" "inspec-gcp-vpn-tunnel" {
  name = "${var.gcp_vpn_tunnel_name}"
  project = "${var.gcp_project_id}"
  region = "${var.gcp_location}"
  peer_ip = "${google_compute_address.inspec-gcp-address.address}"
  shared_secret = "generic_secret"
  target_vpn_gateway = "${google_compute_vpn_gateway.inspec-gcp-vpn-gateway.self_link}"
  remote_traffic_selector = ["0.0.0.0/0"]
  local_traffic_selector  = ["0.0.0.0/0"]

  depends_on = [
    "google_compute_forwarding_rule.inspec-gcp-fr-esp",
    "google_compute_forwarding_rule.inspec-gcp-fr-udp500",
    "google_compute_forwarding_rule.inspec-gcp-fr-udp4500",
  ]
}

# End network resources

# Start Google SQL resources

resource "google_sql_database_instance" "cloud-sql-db-instance" {
  project = "${var.gcp_project_id}"
  name = "${var.gcp_db_instance_name}"
  database_version = "${var.gcp_db_type}"
  region = "${var.gcp_location}"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "${var.gcp_db_size}"
  }
}

resource "google_sql_database" "cloud-sql-db-name" {
  project = "${var.gcp_project_id}"
  name      = "${var.gcp_db_name}"
  instance  = "${google_sql_database_instance.cloud-sql-db-instance.name}"
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "cloud-sql-db-user" {
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_db_user_name}"
  instance = "${google_sql_database_instance.cloud-sql-db-instance.name}"
  password = "${var.gcp_db_user_password}"
}

# End Google SQL resources
