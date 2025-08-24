terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "sg-boilerplate" {
    name = "sg-example"
    description = "Allow http access to ec2."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "server-boilerplate" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.nano"
}