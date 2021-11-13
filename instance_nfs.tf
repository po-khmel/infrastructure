resource "openstack_compute_instance_v2" "nfs-server" {

  name            = "condor_nfs"
  image_name      = "${var.vgcn_image}"
  flavor_name     = "medium"
  key_pair        = "cloud"
  security_groups = ["public"]

  network {
    name = "private_net"
  }
  user_data = file("files/format_volumes.sh")
}
resource "openstack_blockstorage_volume_v2" "tools" {
  name        = "tools"
  description = "tools volume"
  size        = 50
}
resource "openstack_blockstorage_volume_v2" "datamanager" {
  name        = "datamanager"
  description = "datamanager"
  size        = 50
}
resource "openstack_blockstorage_volume_v2" "sync" {
  name        = "sync" 
  description = "sync" 
  size        = 50
}
resource "openstack_blockstorage_volume_v2" "jwd" {
  name        = "jwd"
  description = "jwd"
  size        = 50
}
resource "openstack_blockstorage_volume_v2" "dati" {
  name        = "dati"
  description = "dati"
  size        = 70
}

resource "openstack_compute_volume_attach_v2" "tools" {
  instance_id = "${openstack_compute_instance_v2.nfs-server.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.tools.id}"
  device      = "/dev/vdb"
  
}
resource "openstack_compute_volume_attach_v2" "datamanager" {
  instance_id = "${openstack_compute_instance_v2.nfs-server.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.datamanager.id}"
  device      = "/dev/vdc"
  
}

resource "openstack_compute_volume_attach_v2" "sync" {
  instance_id = "${openstack_compute_instance_v2.nfs-server.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.sync.id}"
  device      = "/dev/vdd"
  
}

resource "openstack_compute_volume_attach_v2" "jwd" {
  instance_id = "${openstack_compute_instance_v2.nfs-server.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.jwd.id}"
  device      = "/dev/vde"
  
}

resource "openstack_compute_volume_attach_v2" "dati" {
  instance_id = "${openstack_compute_instance_v2.nfs-server.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.dati.id}"
  device      = "/dev/vdf"
  
}


