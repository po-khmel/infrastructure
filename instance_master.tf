
resource "openstack_compute_instance_v2" "mastervm" {
  name            = "Master.galaxyproject.it"
  image_name      = "${var.centos_image}"
  flavor_name     = "small"
  key_pair        = "cloud" 
  security_groups = ["public-ssh","default"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}
