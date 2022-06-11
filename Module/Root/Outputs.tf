output "instance_details" {
  value = module.ec2_instance.instance[*].public_ip
}
