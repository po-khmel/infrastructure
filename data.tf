data "openstack_images_image_v2" "vgcn-image" {
  name        = var.vgcn_image.name
  most_recent = true
}

data "openstack_images_image_v2" "rocky-image" {
  name        = var.rocky9_image.name
  most_recent = true
}

