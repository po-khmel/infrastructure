
resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "usegalaxy.condor-central-manager"
  image_name      = "${var.vgcn_image.name}"
  flavor_name     = "m1.small"
  key_pair        = "cloud" 
  security_groups = ["public"]

  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}
