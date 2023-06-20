resource "openstack_compute_instance_v2" "backup" {
  name            = "usegalaxy.database"
  image_name      = data.openstack_images_image_v2.rocky-image.name
  flavor_name     = var.flavors.backup
  key_pair        = data.openstack_compute_keypair_v2.cloud2.name
  security_groups = ["public-ssh", "egress"]

  network {
    name = var.private_network.name
  }
}
