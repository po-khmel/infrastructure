output "galaxy" {
value = openstack_compute_instance_v2.galaxy.network[0].fixed_ip_v4 
}
# output "ftp" {
# value = openstack_compute_instance_v2.ftp.network[0].fixed_ip_v4
# }
# output "mastervm" {
# value = openstack_compute_instance_v2.mastervm.network[0].fixed_ip_v4
# }
output "nfs-server" {
value = openstack_compute_instance_v2.nfs-server.network[0].fixed_ip_v4
}
output "postgres" {
value = openstack_compute_instance_v2.postgres.network[0].fixed_ip_v4
}
output "rabbitmq" {
value = openstack_compute_instance_v2.rabbitmq.network[0].fixed_ip_v4
}
output "vgcnc-cm" {
value = openstack_compute_instance_v2.vgcn-cm.network[0].fixed_ip_v4
}

