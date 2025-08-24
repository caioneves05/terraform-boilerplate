terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

variable "aws_profile" {
  type    = string
  default = null
  description = "AWS CLI profile to use"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_security_group" "security-group-boilerplate" {
    name = "security-group-example"
    description = "Allow http access to ec2."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 65500
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "server-boilerplate" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.nano"
  user_data = file("user_data.sh")

    tags = {
        Name = "boilerplate-server"
    }
  vpc_security_group_ids = [aws_security_group.security-group-boilerplate.id]

  depends_on = [aws_security_group.security-group-boilerplate]
}