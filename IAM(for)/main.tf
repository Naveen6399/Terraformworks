resource "aws_iam_user" "lb" {
  count = length(var.user_names)  
  name = var.user_names[count.index]
}

#using for_each loop
resource "aws_iam_user" "lb" {
  for_each = var.user_names
  name = each.value
}

#using for loop
output "User names" {
  value = [for name in var.user_names : name]
}