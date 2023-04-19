resource "openstack_networking_secgroup_v2" "ufr-ingress" {
  name                 = "ufr-ingress"
  description          = "[tf] Ingress connections from any UFR networks"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "ufr-ingress-40047dc3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "192.52.3.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.ufr-ingress.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ufr-ingress-de4ad9ea" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "132.230.0.0/16"
  security_group_id = "${openstack_networking_secgroup_v2.ufr-ingress.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ufr-ingress-9725f501" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "192.52.2.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.ufr-ingress.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ufr-ingress-58293ee9" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "10.0.0.0/8"
  security_group_id = "${openstack_networking_secgroup_v2.ufr-ingress.id}"
}
