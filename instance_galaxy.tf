resource "openstack_compute_instance_v2" "galaxy" {
  name            = "usegalaxy.galaxy"
  image_name      = data.openstack_images_image_v2.rocky-image.name
  flavor_name     = var.flavors.galaxy
  key_pair        = data.openstack_compute_keypair_v2.cloud2.name
  security_groups = ["egress", "public-web", "public-ssh", "public-ping", "public-condor"]

  # network {
  #   name = var.public_network.name
  # }

  network {
    name = var.private_network.name
  }
}

resource "openstack_networking_floatingip_v2" "galaxy_fl_ip" {
  pool = var.public_network.name
}

resource "openstack_compute_floatingip_associate_v2" "galaxy_fl_ip" {
  floating_ip = data.openstack_networking_floatingip_v2.galaxy_fl_ip.address
  instance_id = data.openstack_compute_instance_v2.galaxy.id
  fixed_ip    = data.openstack_compute_instance_v2.galaxy.network.0.fixed_ip_v4
}

