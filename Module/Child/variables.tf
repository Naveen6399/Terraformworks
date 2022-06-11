
variable "vpc_cidr_block" {
  type = string
  description = "Enter the VPC CIDR block"
}

variable "subnet_cidr_block"{
  type = string
  description = "Enter the Subnet CIDR block"
}

variable subnet_tags{
    type = string
    default = "subnet1"
}

variable env{
    type = string
    description = "Enter the environment"
}

variable "ami" {
     type = string
     description = "Enter the AMI ID"
}

variable "instance_type" {
     type = string
     description = "Enter the instance type"
}

