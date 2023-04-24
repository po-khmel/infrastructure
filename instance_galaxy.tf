resource "openstack_compute_instance_v2" "galaxy" {
  name            = "usegalaxy.galaxy"
  image_name      = "${var.centos8_image.name}"
  flavor_name     = "fl.ada.l"
  key_pair        = "cloud"
  security_groups = ["egress", "public-web2", "public-ping","default","public-ssh"]

  # network {
  #   name = "externalNetwork"
  # }

  network {
    name = "elixir-network"
  }
}

resource "openstack_networking_floatingip_v2" "galaxy_fl_ip" {
  pool = "externalNetwork"
}

resource "openstack_compute_floatingip_associate_v2" "galaxy_fl_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.galaxy_fl_ip.address}"
  instance_id = "${openstack_compute_instance_v2.galaxy.id}"
  fixed_ip    = "${openstack_compute_instance_v2.galaxy.network.0.fixed_ip_v4}"
}

