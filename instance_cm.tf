
resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "condor-central-manager.galaxyproject.it"
  image_name      = "${var.vgcn_image}"
  flavor_name     = "small"
  key_pair        = "cloud" 
  security_groups = ["public"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}
