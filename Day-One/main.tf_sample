provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "practice_bucket" {
  bucket = "omkar-terraform-practice-${random_id.suffix.hex}"

  tags = {
    Name        = "Terraform Practice Bucket"
    Environment = "Learning"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
