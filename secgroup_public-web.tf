resource "openstack_networking_secgroup_v2" "public-web" {
  name        = "public-web"
  description = "[tf] Allow public HTTP + HTTPS connections"
}

resource "openstack_networking_secgroup_rule_v2" "public-web_rule1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "80"
  port_range_max    = "80"
  security_group_id = "${openstack_networking_secgroup_v2.public-web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-web_rule2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "443"
  port_range_max    = "443"
  security_group_id = "${openstack_networking_secgroup_v2.public-web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-web_rule3" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = "80"
  port_range_max    = "80"
  security_group_id = "${openstack_networking_secgroup_v2.public-web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "public-web_rule4" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = "443"
  port_range_max    = "443"
  security_group_id = "${openstack_networking_secgroup_v2.public-web.id}"
}
