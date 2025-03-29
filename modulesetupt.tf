# terraform-project/
# │── modules/
# │   ├── ec2/
# │   │   ├── main.tf
# │   │   ├── variables.tf
# │   │   ├── outputs.tf
# │   ├── s3/
# │   │   ├── main.tf
# │   │   ├── variables.tf
# │   │   ├── outputs.tf
# │── main.tf
# │── variables.tf
# │── outputs.tf



# # Root Module: main.tf

# # Calling the EC2 module
# module "ec2_instance" {
#   source        = "./modules/ec2"
#   instance_type = var.instance_type
# }

# # Calling the S3 module
# module "s3_bucket" {
#   source      = "./modules/s3"
#   bucket_name = var.bucket_name
# }

# # Output values
# output "ec2_public_ip" {
#   value = module.ec2_instance.instance_ip
# }

# output "s3_bucket_name" {
#   value = module.s3_bucket.bucket_name
# }

# ################################
# # Root Module: variables.tf
# ################################
# variable "instance_type" {
#   description = "Type of EC2 instance"
#   type        = string
#   default     = "t2.micro"
# }

# variable "bucket_name" {
#   description = "Name of the S3 bucket"
#   type        = string
#   default     = "my-terraform-bucket"
# }

# ################################
# # Root Module: terraform.tfvars
# ################################
# instance_type = "t3.micro"
# bucket_name   = "custom-bucket-name"

# ################################
# # EC2 Module: modules/ec2/main.tf
# ################################
# resource "aws_instance" "this" {
#   ami           = "ami-12345678"
#   instance_type = var.instance_type

#   tags = {
#     Name = "Terraform-EC2"
#   }
# }

# ################################
# # EC2 Module: modules/ec2/variables.tf
# ################################
# variable "instance_type" {
#   description = "Type of EC2 instance"
#   type        = string
# }

# ################################
# # EC2 Module: modules/ec2/outputs.tf
# ################################
# output "instance_ip" {
#   description = "Public IP of the instance"
#   value       = aws_instance.this.public_ip
# }

# ################################
# # S3 Module: modules/s3/main.tf
# ################################
# resource "aws_s3_bucket" "this" {
#   bucket = var.bucket_name

#   tags = {
#     Name = "Terraform-S3"
#   }
# }

# ################################
# # S3 Module: modules/s3/variables.tf
# ################################
# variable "bucket_name" {
#   description = "Name of the S3 bucket"
#   type        = string
# }

# ################################
# # S3 Module: modules/s3/outputs.tf
# ################################
# output "bucket_name" {
#   description = "Name of the created S3 bucket"
#   value       = aws_s3_bucket.this.bucket
# }