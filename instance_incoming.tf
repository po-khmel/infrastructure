
resource "openstack_compute_instance_v2" "incoming" {
  name        = "${var.incoming-dns}"
  image_name  = "${var.centos_image}"
  flavor_name = "small"
  key_pair    = "cloud2"

  # TODO: tighten up secgroups
  security_groups = ["egress", "public-ssh", "public-web2", "public-ftp"]
##mettere prima pubblica poi privata ReCaS stuff
  network {
    name = "public_net"
  }
  network {
    name = "private_net"
  }
}

#resource "aws_route53_record" "incoming" {
#  zone_id = "${var.zone_galaxyproject_eu}"
#  name    = "${var.incoming-dns}"
#  type    = "A"
#  ttl     = "600"
#  records = ["${openstack_compute_instance_v2.incoming.access_ip_v4}"]
#}
