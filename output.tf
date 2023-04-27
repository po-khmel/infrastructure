# internal ip
# output "galaxy" {
#     value = "${openstack_compute_instance_v2.galaxy.network[0].fixed_ip_v4 }"
# }

output "galaxy_fl_ip" {
  value = "${openstack_networking_floatingip_v2.galaxy_fl_ip.address}"
}

# internal ip
# output "ftp" {
# value = openstack_compute_instance_v2.ftp.network[0].fixed_ip_v4
# }

# internal ip
# output "mastervm" {
# value = openstack_compute_instance_v2.mastervm.network[0].fixed_ip_v4
# }

# internal ip
output "nfs-server" {
    value = "${openstack_compute_instance_v2.nfs-server.network[0].fixed_ip_v4}"
}

# internal ip
output "postgres" {
    value = "${openstack_compute_instance_v2.postgres.network[0].fixed_ip_v4}"
}

# internal ip
# output "rabbitmq" {
#     value = "${openstack_compute_instance_v2.rabbitmq.network[0].fixed_ip_v4}"
# }

output "rabbitmq_fl_ip" {
  value = "${openstack_networking_floatingip_v2.rabbitmq_fl_ip.address}"
}

# internal ip
# output "vgcnc-cm" {
#     value = "${openstack_compute_instance_v2.vgcn-cm.network[0].fixed_ip_v4}"
# }

output "centralmanager_fl_ip" {
  value = "${openstack_networking_floatingip_v2.vgcn_fl_ip.address}"
}