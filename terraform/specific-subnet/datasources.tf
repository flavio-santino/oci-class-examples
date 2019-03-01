# Get list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

variable "AD" {
  description = "Number of ADs"
  type        = "list"
  default     = ["1", "2", "3"]
}

# Get the latest Oracle Linux image
data "oci_core_images" "InstanceImageOCID" {
  compartment_id           = "${var.compartment_ocid}"
  operating_system         = "${var.instance_os}"
  operating_system_version = "${var.linux_os_version}"

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}
