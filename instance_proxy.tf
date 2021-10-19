resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "rabbit.internal.galaxyproject.it"
  image_name      = "${var.centos_image}"
  flavor_name     = "small"
  key_pair        = "cloud"
  security_groups = ["egress", "public-ssh", "public-ping", "public-web2", "public-amqp"]

  network {
    name = "public_net"
  }
}

