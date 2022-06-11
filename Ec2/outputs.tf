output "instance_public_ip" {
    value = aws_instance.int[*].public_ip
    description = "Instance Public IP"
}

output "instance_output"{
    value = var.world
}