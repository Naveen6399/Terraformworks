provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

#terraform aws create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-VPC"
  }
}

#terraform aws create public subnet
resource "aws_subnet" "st1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.st1_cidr_block
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.env}-Public"
  }
}

#terraform aws create private subnet
resource "aws_subnet" "st2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.st2_cidr_block
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Private"
  }
}

#terraform aws create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Igw"
  }
}

#terraform aws create elastic ip
resource "aws_eip" "eip" {
  vpc      = true
}

#terraform aws create nat gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.st1.id

  tags = {
    Name = "gw NAT"
  }
}

#terraform aws create public route table
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt1"
  }
}

#terraform aws create private route table
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "rt2"
  }
}

#terraform aws create route table association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.st1.id
  route_table_id = aws_route_table.rt1.id
}

#terraform aws create route table association
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.st2.id
  route_table_id = aws_route_table.rt2.id
}

#terraform aws create instance
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.st1.id
  associate_public_ip_address = true

  tags = {
    Name = "beta"
  }
}