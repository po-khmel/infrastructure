terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.48.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.76.1"
    }
  }
}

# provider "openstack" {
#   version = "1.21"
# }

# provider "aws" {
#   version = "2.22"
# }