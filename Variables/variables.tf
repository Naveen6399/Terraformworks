variable "my_instance_type"{
    type = string
    description = "My Instance type"
}

variable "instance_tags"{
    type = object ({
        Name = Alpha
        Name = Prod
    })
}