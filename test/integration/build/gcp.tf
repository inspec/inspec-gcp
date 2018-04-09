terraform {
  required_version = "~> 0.11.5"
}

# Configure variables

variable "gcp_project_name" {}
variable "gcp_project_id" {}
variable "gcp_storage_account_name" {}
variable "gcp_admin_password" {}
# Set a unique string which will be appended to public facing items
# to ensure there are no clashes
#variable "suffix" {}

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

variable "gcp_storage_bucket_name" {
  default ="gcp-inspec"
}

provider "google" {}

# TBD: initial GCP account can't create these easily, make as part of the account paving?
#resource "google_project" "Chef_Inspec_GCP" {
#  name = "Inspec GCP ${var.project_name}"
#  project_id = "${var.project_id}"
#}

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

resource "google_storage_bucket" "generic-storage-bucket" {
  project = "${var.gcp_project_id}"
  name     = "${var.gcp_storage_bucket_name}"
  location = "${var.gcp_location}"
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

resource "google_service_account" "generic_service_account_object_viewer" {
  project = "${var.gcp_project_id}"
  account_id   = "object-viewer"
  display_name = "${var.gcp_service_account_display_name}"
}

resource "google_project_iam_custom_role" "generic_project_iam_custom_role" {
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
