# stores terraform state file in s3
terraform {
  backend "s3" {
    bucket = "terraformstatefile2"
    key    = "Myfolder/file/terraform.tfstate"
    region = "ap-south-1"
  }
}
