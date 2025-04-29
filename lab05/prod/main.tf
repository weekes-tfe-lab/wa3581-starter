terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  # Backend configured by HCP Workspace
}

# Variables will be populated by HCP Workspace Variables
variable "queue_prefix" {
  type        = string
  description = "Prefix for queue names, provided by workspace."
}

variable "environment_tag" {
  type        = string
  description = "Tag value for the Environment tag, provided by workspace."
}

provider "aws" {
  region = "us-west-2"
}

module "prod_queue" {
  # Replace <YOUR_ORG_NAME> with your HCP Org Name
  source  = "app.terraform.io/<YOUR_ORG_NAME>/sqs-secure/aws"
  version = "~> 1.0.0" # Use constraint matching published version

  queue_name_prefix = var.queue_prefix # From workspace variable
  enable_dlq        = true             # Keep DLQ enabled for prod

  tags = {
    Project     = "Advanced TF Course"
    Environment = var.environment_tag # From workspace variable
  }
}

# Optional: Define outputs if needed
# output "prod_queue_arn" { value = module.prod_queue.main_queue_arn }