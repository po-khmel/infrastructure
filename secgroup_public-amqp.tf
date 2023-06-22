resource "openstack_networking_secgroup_v2" "public-amqp" {
  name                 = "public-amqp"
  description          = "[tf] Allow incoming AMQP connections"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-amqp-rule1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "5671"
  port_range_max    = "5671"
  security_group_id = openstack_networking_secgroup_v2.public-amqp.id
}

resource "openstack_networking_secgroup_rule_v2" "public-amqp-rule2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "15672"
  port_range_max    = "15672"
  security_group_id = openstack_networking_secgroup_v2.public-amqp.id
}
