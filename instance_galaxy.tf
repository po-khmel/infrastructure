resource "openstack_compute_instance_v2" "galaxy" {
  name            = "galaxy.usegalaxy.it"
  image_name      = "${var.centos_image}"
  flavor_name     = "large"
  key_pair        = "cloud"
  security_groups = ["egress", "public-web2", "public-ping"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}

