# Required Terraform version (optional but recommended)
# terraform {
#   required_version = "= 1.7.0"
# }

terraform {
  backend "s3" {
    bucket  = "ezdevops-v2-terraform-us-east-1"
    key     = "env/${var.environment}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "aws_instance" "example" {
  ami                         = "ami-095a8f574cb0ac0d0" # Ubuntu AMI
  instance_type               = "t3.medium"
  subnet_id                   = "subnet-0063c047e03c260c4"
  key_name                    = "13jan"
  vpc_security_group_ids      = ["sg-0a81b606fed63b01e"]
  associate_public_ip_address = true

  tags = {
    Name     = "MyEC2Instance-${var.environment}"
    Key_Name = "13jan1"
  }
}
