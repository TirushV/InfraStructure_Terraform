# creates a private bucket
resource "aws_s3_bucket" "b" {
    bucket = "my-terraform-bucket"
    acl    = "private"

    tags   = {
        Name = "My bucket"
        Environment = "Prod"
    }
}# stores terraform state file in s3
terraform {
  backend "s3" {
    bucket = "my-terraform-bucket"
    key    = "Myfolder/file/terraform.tfstate"
    region = "ap-south-1"
  }
}