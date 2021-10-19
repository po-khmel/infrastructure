
resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "condor-central-manager.galaxyproject.eu"
  image_name      = "${var.centos_image}"
  flavor_name     = "small"
  key_pair        = "cloud2" 
  security_groups = ["public"]

  network {
    name = "private_net"
  }
}
