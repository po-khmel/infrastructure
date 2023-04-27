resource "openstack_compute_instance_v2" "postgres" {
  name            = "usegalaxy.database" 
  image_name      = "${var.database_image.name}"
  flavor_name     = "${var.flavors.database}"
  key_pair        = "${openstack_compute_keypair_v2.cloud2.name}"
  security_groups = ["public-ssh","public","default"]

  network {
    name = "${var.private_network.name}"
  }
}

