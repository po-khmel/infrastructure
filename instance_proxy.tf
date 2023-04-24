resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "usegalaxy.rabbitmq"
  image_name      = "${var.centos8_image.name}"
  flavor_name     = "fl.ada.s"
  key_pair        = "cloud"
  security_groups = ["egress", "public-ssh", "public-ping", "public-web2", "public-amqp","default"]

  # network {
  #   name = "externalNetwork"
  # }
}

resource "openstack_networking_floatingip_v2" "rabbitmq_fl_ip" {
  pool = "externalNetwork"
}

resource "openstack_compute_floatingip_associate_v2" "rabbitmq_fl_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.rabbitmq_fl_ip.address}"
  instance_id = "${openstack_compute_instance_v2.rabbitmq.id}"
  # fixed_ip    = "${openstack_compute_instance_v2.rabbitmq.network.0.fixed_ip_v4}"
}

