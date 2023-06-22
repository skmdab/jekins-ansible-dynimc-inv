provider "aws"{
region = "ap-southeast-1"   
}

resource "aws_instance" "AWStomcat" {
ami = "ami-02acda7aaa1f944e5"
instance_type = "t2.micro"
key_name = "filinta"
security_groups = ["Filinta-public-subnet-1b"]
tags = {
Name = "tomcat-instance"
}
}
