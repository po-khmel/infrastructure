resource "openstack_networking_secgroup_v2" "public-mumble" {
  name                 = "public-mumble"
  description          = "[tf] Allow incoming MUMBLE connections"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-mumble-ingress-tcp4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "64738"
  port_range_max    = "64738"
  security_group_id = "${openstack_networking_secgroup_v2.public-mumble.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-mumble-ingress-udp4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "64738"
  port_range_max    = "64738"
  security_group_id = "${openstack_networking_secgroup_v2.public-mumble.id}"
}
