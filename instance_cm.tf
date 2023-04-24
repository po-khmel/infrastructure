
resource "openstack_compute_instance_v2" "vgcn-cm" {
  name            = "usegalaxy.condor-central-manager"
  image_name      = "${var.vgcn_image.name}"
  flavor_name     = "fl.ada.s"
  key_pair        = "cloud" 
  security_groups = ["public"]

  network {
    name = "externalNetwork"
  }
  network {
    name = "elixir-network"
  }
}
