resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "usegalaxy.rabbitmq"
  image_name      = "${var.centos8_image.name}"
  flavor_name     = "m1.small"
  key_pair        = "cloud"
  security_groups = ["egress", "public-ssh", "public-ping", "public-web2", "public-amqp","default"]

  network {
    name = "public_net"
  }
}

