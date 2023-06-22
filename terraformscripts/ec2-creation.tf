provider "aws"{
region = "ap-south-1"   
}

resource "aws_instance" "AWS_EC2_INSTANCE"{
ami = "ami-00f898fc5c0fb69d1"
instance_type = "t2.micro"
key_name = "filinta"
security_groups = ["Filinta-public-subnet-1b"]
counts = "2"
tags={
Name = "tomcat-instance"
}
}
