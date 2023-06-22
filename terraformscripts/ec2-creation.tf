provider "aws"{
region = "ap-south-1"   
}

resource "aws_instance" "AWStomcat" {
ami = "ami-00f898fc5c0fb69d1"
instance_type = "t2.micro"
key_name = "filinta"
security_groups = ["default"]
tags = {
Name = "tomcat_instance"
}
}
