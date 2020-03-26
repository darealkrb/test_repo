provider "aws" {
  region = "${var.aws_region}"
  }
  
resource "aws_instance" "Amazon-linux"{
    ami = "${var.image_id}"
    instance_type = "${var.instance_type}"
    security_groups = ["${data.aws_security_group.default_security_group.id}"]
    subnet_id = "subnet-0350260c"
    tags = {
      Name = "candidate423"
      Owner = "candidate423"
      }
      volume_tags = {
        Name = "candidate423"
        Owner = "candidate423"
      }
    user_data = "${file("user_data_nginx.sh")}"
    
}


data "aws_vpc" "default_vpc" {
  
  id = "vpc-0226e478"
}
data "aws_security_group" "default_security_group" {
  name = "default"
  id = "sg-8a433ec0"
}

#### Script for creating AWS ELB

# resource "aws_elb" "ELB" {
#   name = "candidate423"
#   instances = ["${aws_instance.Amazon-linux.id}"]
#   # security_groups = [aws_default_security_group.default.id ]
#   security_groups = ["${data.aws_security_group.default_security_group.id}"]
#   subnets = ["subnet-0350260c"]

#     listener {
#     instance_port     = 80
#     instance_protocol = "HTTP"
#     lb_port           = 80
#     lb_protocol       = "HTTP"
#   }  

# }






