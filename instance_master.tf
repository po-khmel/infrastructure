
resource "openstack_compute_instance_v2" "mastervm" {
  name            = "Master.galaxyproject.it"
  image_id      = "${var.ubuntu20-04_image}"
  flavor_name     = "small"
  key_pair        = "cloud" 
  security_groups = ["egress", "public-ssh","default"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}
