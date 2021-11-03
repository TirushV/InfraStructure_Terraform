# stores terraform state file in s3
terraform {
  backend "s3" {
    bucket = "my-terraform-bucket"
    key    = "Myfolder/file/terraform.tfstate"
    region = "ap-south-1"
  }
}
