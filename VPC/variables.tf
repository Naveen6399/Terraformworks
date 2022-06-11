variable "aws_region"{
    type = string
    descriprion = "Enter the aws region"
}

variable "access_key" {
  type = string
  description = "Enter the access key"
}

variable "secret_key" {
  type = string
  description = "Enter the secret key"
}

variable "vpc_cidr_block" {
  type = string
  description = "Enter the VPC cidr"
}

variable "env" {
  type = string
  description = "Enter the Environment"
}

variable "st1_cidr_block" {
  type = string
  description = "Enter the subnet1 cidr"
}

variable "st2_cidr_block" {
  type = string
  description = "Enter the subnet2 cidr"
}

variable "ami" {
  type = string
  description = "Enter the ami"
}

variable "instance_type" {
  type = string
  description = "Enter the instance type"
}
