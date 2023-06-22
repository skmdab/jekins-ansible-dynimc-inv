provider "aws"{
region = "us-east-1"   
}

resource "aws_instance" "AWStomcat" {
ami = "ami-00f898fc5c0fb69d1"
instance_type = "t2.micro"
key_name = "filinta"
security_groups = ["Filinta-public-subnet-1b"]
tags = {
Name = "tomcat-instance"
}
}
