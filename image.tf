### comment out totally if you have the image uploaded ###

# resource "openstack_images_image_v2" "vgcn-image" {
#   name             = "${var.vgcn_image.name}"
#   image_source_url = "${var.vgcn_image.image_source_url}"
#   container_format = "${var.vgcn_image.container_format}"
#   disk_format      = "${var.vgcn_image.disk_format}"
# }

# data "openstack_images_image_v2" "vgcn-image" {
#   name        = "${var.vgcn_image.name}"
#   most_recent = true
# }