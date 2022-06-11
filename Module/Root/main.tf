provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA54DE3HFQ3COZ6FPJ"
  secret_key = "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"
}

module "ec2_instance" {
  source  = "../child/"
  env = "prod"
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  ami = "ami-06a0b4e3b7eb7a300"
  instance_type = "t2.micro"

}