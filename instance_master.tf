
# resource "openstack_compute_instance_v2" "mastervm" {
#   name            = "usemastervm.controlvm"
#   image_id        = "${var.ubuntu20-04_image.id}"
#   flavor_name     = "fl.ada.s"
#   key_pair        = "cloud" 
#   security_groups = ["egress", "public-ssh","default"]

#   # network {
#   #   name = "externalNetwork"
#   # }

#   network {
#     name = "elixir-network"
#   }
# }

# resource "openstack_networking_floatingip_v2" "mastervm_fl_ip" {
#   pool = "externalNetwork"
# }

# resource "openstack_compute_floatingip_associate_v2" "mastervm_fl_ip" {
#   floating_ip = "${openstack_networking_floatingip_v2.mastervm_fl_ip.address}"
#   instance_id = "${openstack_compute_instance_v2.mastervm.id}"
#   fixed_ip    = "${openstack_compute_instance_v2.mastervm.network.0.fixed_ip_v4}"
# }