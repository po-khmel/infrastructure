resource "openstack_compute_instance_v2" "postgres" {
  name            = "usegalaxy.database" 
  image_id     = "${var.ubuntu20-04_image}"
  flavor_name     = "large"
  key_pair        = "cloud"
  security_groups = ["public-ssh","public","default"]

  network {
    name = "private_net"
  }
}

