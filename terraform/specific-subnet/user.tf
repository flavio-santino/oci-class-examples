resource "oci_identity_user" "user01" {
  name        = "user01-TF"
  description = "A user managed with Terraform"
}

resource "oci_identity_ui_password" "user01_password" {
  user_id = "${oci_identity_user.user01.id}"
}
