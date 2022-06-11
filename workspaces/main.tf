provider "aws" {
  region     = var.region
  access_key = "AKIA54DE3HFQ3COZ6FPJ"
  secret_key = "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"
}

locals {
  instance_name = "${terraform.workspace}"
}

resource "aws_instance" "int1" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true

  tags = {
    Name = "${local.instance_name} - instance"
  }
}
