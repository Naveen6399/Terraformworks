provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA54DE3HFQRSKXRI5J"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "beta"
  }

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip} > public-ip.txt"
  }
}