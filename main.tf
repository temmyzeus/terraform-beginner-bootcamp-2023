terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }

  cloud {
    organization = "My-Terraform-Bootcamp"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length  = 36
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "bucket_name" {
  bucket = random_string.bucket_name.id
  tags = {
    Name = "Terraform Bootcamp Bucket"
    Type = "tutorial"
  }
}

output "bucket_name" {
  value = random_string.bucket_name.id
}
