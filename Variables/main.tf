provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA54DE3HFQ7CMBX34E"
  secret_key = "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"
}

resource "aws_instance" "main" {
  ami           = "ami-06a0b4e3b7eb7a300"
  instance_type = var.my_instance_type

  tags = Var.instance_tags
  }