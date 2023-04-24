
# resource "openstack_compute_instance_v2" "ftp" {
#   name        = "usegalaxy.ftp"
#   image_name  = "${var.centos_image.name}"
#   flavor_name = "fl.ada.s"
#   key_pair    = "cloud"

#   # TODO: tighten up secgroups
#   security_groups = ["egress", "public-ssh", "public-web2", "public-ftp","default"]
# ##mettere prima pubblica poi privata ReCaS stuff
#   network {
#     name = "public_net"
#   }
#   network {
#     name = "private_net"
#   }
# }

