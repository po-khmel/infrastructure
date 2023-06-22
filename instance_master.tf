resource "openstack_compute_instance_v2" "mastervm" {
  name            = "usemastervm.controlvm"
  image_name      = var.controlvm_image.name
  flavor_name     = var.flavors.controlvm
  key_pair        = data.openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "egress"]

  # network {
  #   name = var.public_network.name
  # }

  network {
    name = var.private_network.name
  }
}

resource "openstack_networking_floatingip_v2" "mastervm_fl_ip" {
  pool = var.public_network.name
}

resource "openstack_compute_floatingip_associate_v2" "mastervm_fl_ip" {
  floating_ip = data.openstack_networking_floatingip_v2.mastervm_fl_ip.address
  instance_id = data.openstack_compute_instance_v2.mastervm.id
  fixed_ip    = data.openstack_compute_instance_v2.mastervm.network.0.fixed_ip_v4
}
