resource "openstack_networking_secgroup_v2" "Public" {
  name                 = "public"
  description          = "[tf] Completely public machine (ingress + egress)"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "Public-ingress-ports4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "1"
  port_range_max    = "65535"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "Public-ingress-port3389-ipv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "3389"
  port_range_max    = "3389"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "Public-egress-ports6" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "Public-egress-ports4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "Public-ingress-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "22"
  port_range_max    = "22"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "Public-ingress-http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "80"
  port_range_max    = "80"
  security_group_id = "${openstack_networking_secgroup_v2.Public.id}"
}
