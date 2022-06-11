variable "user_names" {
  type = list(string)
  description = "Enter the user names"
  default = [ "Fast","Faster","Fastest" ]
}

#for_each loop
variable "user_names" {
  type = set(string)
  description = "Enter the user names"
  default = [ "Slow","Slower","Slowest" ]
}


