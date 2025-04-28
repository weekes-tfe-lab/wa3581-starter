terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" // Use an appropriate AWS provider version
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }

  # Backend is configured implicitly by HCP Terraform Workspace
}

provider "aws" {
  region = "us-west-2" // Ensure correct region
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "learning_bucket" {
  bucket = "tf-adv-lab01-${random_string.suffix.result}" # Construct unique name

  tags = {
    Name = "TF Advanced Lab 1 Bucket"
  }
}