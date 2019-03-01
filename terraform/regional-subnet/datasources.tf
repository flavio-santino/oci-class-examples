# List of Availability Domains on Phoenix Region.
variable "ad_list_phx" {
  type = "list"
  default = ["AKFI:PHX-AD-1","AKFI:PHX-AD-2","AKFI:PHX-AD-3"]
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
