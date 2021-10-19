resource "openstack_compute_instance_v2" "postgres" {
  name            = "postegres.usegalaxy.it"
  image_name      = "${var.centos_image}"
  flavor_name     = "large"
  key_pair        = "cloud"
  security_groups = ["public"]

  network {
    name = "private_net"
  }
}

