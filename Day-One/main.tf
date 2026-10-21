provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "practice_bucket" {
  ami = "ami-04f617474d20eae29"
  instance_type = "t3.micro"
  }

