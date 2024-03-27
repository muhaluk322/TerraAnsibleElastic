variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  default = "ami-080e1f13689e07408" # Ubuntu 22.04
}

variable "sg_id" {}

variable "subnet_id" {}

variable "environment" {}

variable "key_name" {}

