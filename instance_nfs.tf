resource "openstack_compute_instance_v2" "nfs-server" {

  name            = "usegalaxy.condor-nfs"
  image_name      = "${var.vgcn_image.name}"
  flavor_name     = "fl.ada.m"
  key_pair        = "cloud"
  security_groups = ["public"]

  network {
    name = "elixir-network"
  }

  block_device {
    uuid                  = "${var.vgcn_image.id}"
    source_type           = "image"
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v2.nfs_volume.id}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }
  user_data = file("files/create_share.sh")
}

resource "openstack_blockstorage_volume_v3" "nfs_volume" {
  name        = "nfs"
  description = "nfs volume"
  volume_type = "__DEFAULT__"
  size        = 200
}

#data "template_cloudinit_config" "nfs-share" {
#  gzip          = true
#  base64_encode = true
#
#  part {
#    content_type = "text/x-shellscript"
#    content      = file("${path.module}/files/create_share.sh")
#  }

#}



