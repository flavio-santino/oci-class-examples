# Compute Instances

resource "oci_core_instance" "instances" {
  count               = "${var.instance_count}"
  availability_domain = "${element(var.ad_list_phx, count.index)}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "tf-server-${count.index +1}"
  shape               = "${var.instance_shape}"
  subnet_id           = "${oci_core_subnet.subnet.id}"

  source_details {
    source_type             = "image"
    source_id               = "${data.oci_core_images.InstanceImageOCID.images.0.id}"
    boot_volume_size_in_gbs = "50"
  }

  metadata {
    ssh_authorized_keys = "${chomp(file(var.ssh_public_key))}"
  }

  connection {
    type        = "ssh"
    host        = "${self.public_ip}"
    user        = "opc"
    private_key = "${chomp(file(var.ssh_private_key))}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'This instance was provisioned by Terraform.' | sudo tee /etc/motd",
    ]
  }
}
