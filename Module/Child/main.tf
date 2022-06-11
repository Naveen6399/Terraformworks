resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

}

resource "aws_subnet" "st1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_block


}

resource "aws_instance" "int1" {
  count = "${var.env == "prod" ? 1 : 0}"  
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.st1.id
  associate_public_ip_address = true

}

