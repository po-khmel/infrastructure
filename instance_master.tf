# resource "openstack_compute_instance_v2" "mastervm" {
#   name            = "usemastervm.controlvm"
#   image_id        = "${var.controlvm_image.id}"
#   flavor_name     = "${var.flavors.controlvm}"
#   key_pair        = "${openstack_compute_keypair_v2.cloud2.name}" 
#   security_groups = ["egress", "public-ssh","default"]

#   # network {
#   #   name = "${var.public_network.name}"
#   # }

#   network {
#     name = "${var.private_network.name}"
#   }
# }

# resource "openstack_networking_floatingip_v2" "mastervm_fl_ip" {
#   pool = "${var.public_network.name}"
# }

# resource "openstack_compute_floatingip_associate_v2" "mastervm_fl_ip" {
#   floating_ip = "${openstack_networking_floatingip_v2.mastervm_fl_ip.address}"
#   instance_id = "${openstack_compute_instance_v2.mastervm.id}"
#   fixed_ip    = "${openstack_compute_instance_v2.mastervm.network.0.fixed_ip_v4}"
# }