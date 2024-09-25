terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# Define unique instance names
variable "instance_names" {
  default = ["Server1", "Server2", "Server3", "Server4", "Server5"]
}

# Launch multiple instances with unique names using for_each
resource "aws_instance" "s1" {
  for_each      = toset(var.instance_names)  # Use a set of unique names
  ami           = "ami-0ebfd941bbafe70c6"    # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = each.key  # Use the name from the instance_names list
  }
}

# Output the Public IPs of all instances
output "instance_public_ips" {
  value = { for name, instance in aws_instance.s1 : name => instance.public_ip }
}

