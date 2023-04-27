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
    "name" = "vggp-v40-j214-495f8c33c4b0-master"
    "id" = "dd38d091-6dfb-4c0a-a18c-9be041db70ef"
  }
}

variable "nfs" {
  type = map
  default = {
    "name"        = "nfs"
    "description" = "nfs volume"
    "disk_size"   = 300
    "volume_type" = "__DEFAULT__"
  }
}

variable "private_network" {
  type = map
  default = {
    "name" = "elixir-network"
  }
}

variable "public_network" {
  type = map
  default = {
    "name" = "externalNetwork"
  }
}

variable "flavors" {
  type = map
  default = {
    "central-manager" = "fl.ada.s"
    "database"        = "fl.ada.l"
    "galaxy"          = "fl.ada.l"
    "controlvm"       = "fl.ada.s"
    "nfs-server"      = "fl.ada.m"
    "rabbitmq"        = "fl.ada.s"
    "ftp"             = "fl.ada.s"
  }
}

variable "public_key" {
  type = map
  default = {
    name = "cloud"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv0/H8VaGgmIaOZ04HYKZKssZARXf2QPB6JGmlbiFpwA7MxakuBkPzm9t+UsGd6vWZ+LDQY+MdZNGt2Nm0e/0TJO9Ilxc/nANPYqR5rzOBFUkXlKw57zxmXVr6Aamrl5ePS13zUNeM34PKG78CA92quG0YNjYeCZon4UiyAfXHzdcvTcwn2lbRsaxMTDxlO8r7ZKf9rDuyjf4Q98hVqDjN57+3ZIoU4o9PBJg+8TpiCe5igMtM53WmbhUk1EuiZoB6Hnc+OpaoPhFAjcxANVw4CMII5YzxN9YCdk9jAPXE4WEb1vnSm9HWoOuZiJoOgb2ngeTX5maioUP7ugVJyE7N9iaFMCz4P7cjfEKHu01EgP8H7Ts65DqcX4Xu8pUYbCPBHzvUFcHDngV/mG2Fabk4MOrdoGC2DXKKE+LRVjEDlaXMVN7kc3qKP9/4euna6gBoIp530MgRitIGmlPHyMKAeRfIXz2e7FONCUSzRHp4deo127fzl79hVOFUacnEbg8= pokhmel@master"
	}
}