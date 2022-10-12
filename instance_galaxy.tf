resource "openstack_compute_instance_v2" "galaxy" {
  name            = "usegalaxy.galaxy"
  image_name      = "${var.centos8_image}"
  flavor_name     = "large"
  key_pair        = "cloud"
  security_groups = ["egress", "public-web2", "public-ping","default","public-ssh"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}

