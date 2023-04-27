resource "openstack_compute_instance_v2" "galaxy" {
  name            = "usegalaxy.galaxy"
  image_name      = "${var.centos8_image.name}"
  flavor_name     = "${var.flavors.galaxy}"
  key_pair        = "${openstack_compute_keypair_v2.cloud2.name}"
  security_groups = ["egress", "public-web2", "public-ping","default","public-ssh"]

  # network {
  #   name = "${var.public_network.name}"
  # }

  network {
    name = "${var.private_network.name}"
  }
}

resource "openstack_networking_floatingip_v2" "galaxy_fl_ip" {
  pool = "${var.public_network.name}"
}

resource "openstack_compute_floatingip_associate_v2" "galaxy_fl_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.galaxy_fl_ip.address}"
  instance_id = "${openstack_compute_instance_v2.galaxy.id}"
  fixed_ip    = "${openstack_compute_instance_v2.galaxy.network.0.fixed_ip_v4}"
}

