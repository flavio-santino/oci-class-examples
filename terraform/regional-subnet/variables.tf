# Data from terraform.tfvars file
variable "tenancy_ocid" {}

variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

# VCN variables
variable "vcn_cidr" {
  default = "192.168.0.0/16"
}

variable "vcn_dns_label" {
  description = "VCN DNS label"
  default     = "vcn01"
}

variable "dns_label" {
  description = "Subnet DNS Label"
  default     = "subnet"
}

# OS Images
variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.6"
}

### Compute Shape and Number of Instances
variable instance_count {
  description = "Number of instances"
  default     = "4"
}

variable instance_shape {
  description = "Instance Shape"
  default     = "VM.Standard2.1"
}

output "InstancePublicIP" {
  value = ["${oci_core_instance.instances.*.public_ip}"]
}
