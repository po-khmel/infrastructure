resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "usegalaxy.condor-central-manager"
  image_name      = "${var.vgcn_image.name}"
  flavor_name     = "${var.flavors.central-manager}"
  key_pair        = "${openstack_compute_keypair_v2.cloud2.name}" 
  security_groups = ["public"]

  # network {
  #   name = "${var.public_network.name}"
  # }

  network {
    name = "${var.private_network.name}"
  }
}

resource "openstack_networking_floatingip_v2" "vgcn_fl_ip" {
  pool = "${var.public_network.name}"
}

resource "openstack_compute_floatingip_associate_v2" "vgcn_fl_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.vgcn_fl_ip.address}"
  instance_id = "${openstack_compute_instance_v2.vgcn-cm.id}"
  fixed_ip    = "${openstack_compute_instance_v2.vgcn-cm.network.0.fixed_ip_v4}"
}
