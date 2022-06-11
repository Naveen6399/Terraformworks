variable instance_type{
    type = string
    description = "My Instance Type"
}

variable "env" {
    type = string
    description = "Enter Env Name"
}

variable instance_ami {
    type = string
    default = "ami-06a0b4e3b7eb7a300"
    description = "Enter Instance AMI"
}

variable instance_tags {
    default = "Alpha"
}

variable world {
  type = map
  description = "Enter the country"
  
}