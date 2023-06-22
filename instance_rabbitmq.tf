resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "usegalaxy.rabbitmq"
  image_name      = var.ubuntu_image.name
  flavor_name     = var.flavors.rabbitmq
  key_pair        = data.openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "public-ping", "public-amqp", "egress"]

  # network {
  #   name = var.public_network.name
  # }
  network {
    name = var.private_network.name
  }
}

resource "openstack_networking_floatingip_v2" "rabbitmq_fl_ip" {
  pool = var.public_network.name
}

resource "openstack_compute_floatingip_associate_v2" "rabbitmq_fl_ip" {
  floating_ip = data.openstack_networking_floatingip_v2.rabbitmq_fl_ip.address
  instance_id = data.openstack_compute_instance_v2.rabbitmq.id
}

