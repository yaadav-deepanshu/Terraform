terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = ""    
  secret_key = ""  
  }

resource "aws_instance" "s1" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"

  tags = {
    Name = "Server1"
  }
}
