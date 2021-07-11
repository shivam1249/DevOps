#creating EC2 instance with VPC



#user were created to access AWS 
provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}


resource "aws_vpc" "devops" {
    cidr_block = "10.0.0.0/16"
  
}
#Create internet gateway

resource "aws_internet_gateway" "IGW-devops" {
    vpc_id = aws_vpc.devops.id
  
}

#create security group

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web  inbound traffic"
  vpc_id      = aws_vpc.devops.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

#create network




#create Ec2


resource "aws_instance" "devops" {
    ami = "ami-0c1a7f89451184c8b"
    instance_type = "t2.micro"
    key_name = "main-key"
   

}



