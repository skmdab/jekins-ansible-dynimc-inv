provider "aws"{
region = "ap-south-1"   
}

resource "aws_instance" "AWStomcat" {
ami = "ami-00f898fc5c0fb69d1"
instance_type = "t2.micro"
key_name = "filinta"
vpc_id = "vpc-02628d47ad37e3d61"
security_groups = ["Filinta-public-subnet-1b"]
tags = {
Name = "tomcat-instance"
}
}
