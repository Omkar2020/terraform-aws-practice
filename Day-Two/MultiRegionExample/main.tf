terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

#AWS CLI profile configured in Ubuntu
variable "aws_profile" {
  description = "AWS CLI profile used for this Practice"
  type        = string
  default     = "terraform-learning"
}

#Default provider: Mumbai
provider "aws" {
  region  = "ap-south-1"
  profile = var.aws_profile
}

#Second Provider Configuration:Hyderabad

provider "aws" {
  alias   = "hyderabad"
  region  = "ap-south-2"
  profile = var.aws_profile
}


#Bucket in Mumbai:User the default provider configuration
resource "aws_s3_bucket" "mumbai" {
  bucket_prefix = "omkar-mumbai-practice-"
  tags = {
    Environment = "Learning"
    Location    = "Mumbai"
  }
}

# Buckets in Hyderabad :uses the aliased provider 

resource "aws_s3_bucket" "hyderabad" {
  provider = aws.hyderabad

  bucket_prefix = "omkar-hyderabad-practice-"

  tags = {
    Environment = "Learning"
    Location    = "Hyderabad"
  }
}

output "mumbai_bucket_name" {
  value = aws_s3_bucket.mumbai.id
}

output "hyderabad_bucket_name" {
  value = aws_s3_bucket.hyderabad.id
}

