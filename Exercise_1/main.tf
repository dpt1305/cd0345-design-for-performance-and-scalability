# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "udacity"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_key_pair" "udacity_key" {
    key_name   = "udacity-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4nD52xDBp38o0m5m7BQDmZWilZwBOYE9SrrSIgbFRt17f3TMbvO6ak4rVjHs0M1Vwttlh5s1jYCdH38r16fh+PiXvVTfkZ3FL03EbiJOJyTJJIe9tMFOpm6rB+TOiIypWnzIrJMNIjnTyjw6WD6/03fKqSI9UthCNjf8qNEGAqAEEZ4j+H4ypiVqVLk+RYd76LJHtM0ucVCgGXaRHy1UVZ3HEKmOhf2D4Pi3QG4ensbiqFFHEvppPhxfSNvn+K3a/0jFU8W9ZnbAFOyxEEhDWsDPSwYgeXJDeQtzsQYa0qhGna/RTwOHdElZSZXUiyAO2Jvzk3ldqNPUI2zxOFlcZUGrjaSJTuimdJlvbFSC0V2otmdmNid9KbJULTFBl6tN9l3iJq3y0Ne9nVVqkWRAQHkrO0/ho6tahyLz/VZnyXKU8IVMNdj+9RkxzUD1KHeMc9x/o7Yr35069rw3vfLbX3nqVxZO73AZj5vTofoMlJFLgiJt3SQ/HvFPSz9D/TbMh9oA+fJdo7e160JmSi4hrV+ftoYTyjuwvU+UejcF1TiziChupDrcaR92xa2nm0QP0am6KJS2jG293LEeYm0skF/V9N5vWbuiXaJGGX0EAEI2KW8qtgxJx8dTmi/54mDvXEZf8X9zzS+GlbQlKSg2Bn8acP7cJsT6BemNhO/gB2Q== tungplatin@gmail.com"
}
resource "aws_instance" "micro_instance_1" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-0c53ad4ad49f2cfe3"
    key_name = resource.aws_key_pair.udacity_key.key_name
    tags = {
        Name = "Udacity T2"
        Project = "udacity_pjt_2"
    }
}
resource "aws_instance" "micro_instance_2" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-0c53ad4ad49f2cfe3"
    key_name = resource.aws_key_pair.udacity_key.key_name
    tags = {
        Name = "Udacity T2"
        Project = "udacity_pjt_2"
    }
}
resource "aws_instance" "micro_instance_3" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-0c53ad4ad49f2cfe3"
    key_name = resource.aws_key_pair.udacity_key.key_name
    tags = {
        Name = "Udacity T2"
        Project = "udacity_pjt_2"
    }
}
resource "aws_instance" "micro_instance_4" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-0c53ad4ad49f2cfe3"
    key_name = resource.aws_key_pair.udacity_key.key_name
    tags = {
        Name = "Udacity T2"
        Project = "udacity_pjt_2"
    }
}


# TODO: provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "large_instance_1" {
#     ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
#     instance_type = "m4.large"
#     subnet_id = "subnet-0c53ad4ad49f2cfe3"
#     key_name = resource.aws_key_pair.udacity_key.key_name
#     tags = {
#         Name = "Udacity M4"
#         Project = "udacity_pjt_2"
#     }
# }
# resource "aws_instance" "large_instance_2" {
#     ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
#     instance_type = "m4.large"
#     subnet_id = "subnet-0c53ad4ad49f2cfe3"
#     key_name = resource.aws_key_pair.udacity_key.key_name
#     tags = {
#         Name = "Udacity M4"
#         Project = "udacity_pjt_2"
#     }
# }