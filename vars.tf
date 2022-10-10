
variable "centos_image" {
  default = "vggp-v31-j132-4ab83d5ffde9-master"
}
variable "centos8_image" {
  default = "CentOS-8-ec2-8.4.2105-20210603.0.x86_64"
}
variable "ubuntu20-04_image" {
  default = "41b5f4cd-849f-48f7-8ee9-59b59f3f5fbf"
}
variable "vgcn_image"{
  type = map(string)
  default= { 
    "name" = "vggp-v40-j214-495f8c33c4b0-master"
    "id" = "d92781a6-bbb5-4238-8fd7-c38d2cc8b68f"
}
}
variable "ftp" {
  default = "ftp.galaxyproject.it"
}
variable "nfs_disk_size" {
  default = 3
}

