# resource "openstack_networking_secgroup_v2" "public-ftp" {
#   name                 = "public-ftp"
#   description          = "[tf] Allow FTP connections from anywhere"
#   delete_default_rules = "true"
# }

# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule1" {
#   direction         = "egress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = "20"
#   port_range_max    = "20"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }

# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule2" {
#   direction         = "egress"
#   ethertype         = "IPv6"
#   protocol          = "tcp"
#   port_range_min    = "20"
#   port_range_max    = "20"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }


# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule3" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = "20"
#   port_range_max    = "21"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }

# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule4" {
#   direction         = "ingress"
#   ethertype         = "IPv6"
#   protocol          = "tcp"
#   port_range_min    = "20"
#   port_range_max    = "21"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }

# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule5" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = "56000"
#   port_range_max    = "60000"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }

# resource "openstack_networking_secgroup_rule_v2" "public_ftp_rule6" {
#   direction         = "ingress"
#   ethertype         = "IPv6"
#   protocol          = "tcp"
#   port_range_min    = "56000"
#   port_range_max    = "60000"
#   security_group_id = "${openstack_networking_secgroup_v2.public-ftp.id}"
# }
