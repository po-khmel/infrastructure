# variable "centos_image" {
#   default = "vggp-v31-j132-4ab83d5ffde9-master" # ftp image
# }

variable "centos8_image" {
  type = map
  default = {
    "name" = "CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64"
    "id"   = "b3282e0e-0848-453b-9ff4-f799222ed82f"
  }
}

variable "ubuntu20-04_image" {
  type = map
  default = {
    "name" = "Ubuntu Server 20.04 LTS (Focal Fossa)"
    "id"   = "0f22f335-8175-4e68-b730-44b8d2c1973d"
  }
}

variable "vgcn_image"{
  type = map
  default= { 
    "name" = "vggp-v60-j225-1a1df01ec8f3-dev"
    "id" = "a2291cc6-4947-4d3c-870e-16e0afccaa75"
  }
}

variable "nfs_disk_size" {
  default = 3
}

