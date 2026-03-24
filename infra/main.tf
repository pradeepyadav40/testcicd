terraform {
  required_version = "= 1.14.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

locals {
  bucket_prefix = "example-"
}