resource "openstack_networking_secgroup_v2" "vgcn-ingress-public" {
  name                 = "vgcn-ingress-public"
  description          = "[tf] Allow any incoming connection"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "vgcn-ingress-public-ports4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.vgcn-ingress-public.id}"
}

resource "openstack_networking_secgroup_rule_v2" "vgcn-ingress-public-ports6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.vgcn-ingress-public.id}"
}
