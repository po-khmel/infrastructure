# resource "openstack_compute_instance_v2" "ftp" {
#   name        = "usegalaxy.ftp"
#   image_name  = "${var.ftp_image.name}"
#   flavor_name = "${var.flavors.ftp}"
#   key_pair    = "${openstack_compute_keypair_v2.cloud2.name}"

#   # TODO: tighten up secgroups
#   security_groups = ["egress", "public-ssh", "public-web2", "public-ftp","default"]
# ##mettere prima pubblica poi privata ReCaS stuff
#   network {
#     name = "${var.public_network.name}"
#   }
#   network {
#     name = "${var.private_network.name}"
#   }
# }

