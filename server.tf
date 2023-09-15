terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0f844a9675b22ea32"
  instance_type = "t2.micro"
  key_name = "swapnil-import"

  tags = {
    Name = "Swapnil-DevOps-batch-server"
    env = "Production"
    owner = "Swapnil Bengal"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

