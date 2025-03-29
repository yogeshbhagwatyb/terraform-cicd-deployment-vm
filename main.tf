# terraform {
#   required_version = "= 1.7.0"
# }

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-095a8f574cb0ac0d0" # Ubuntu AMI
  instance_type = "t3.medium"
  # subnet_id                   = aws_subnet.example_subnet[0].id
  subnet_id = "subnet-0063c047e03c260c4"
  key_name  = "13jan"
  # vpc_security_group_ids      = [aws_security_group.example_sg.id]
  vpc_security_group_ids      = ["sg-0a81b606fed63b01e"]
  associate_public_ip_address = true


  tags = {
    Name     = "MyEC2Instance-1"
    Key_Name = "13jan1"
  }

}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "ec2_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.example.private_ip
}


output "instance_tags" {
  value = aws_instance.example.tags
}

output "subnet_cidr_blocks" {
  value = [for s in aws_subnet.example_subnet : s.cidr_block]
}

locals {
  example_string = "hello, world!"
}

output "uppercase_string" {
  value = upper(local.example_string)
}
