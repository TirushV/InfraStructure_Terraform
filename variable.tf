# VPC Variables
variable "region" {
  default       = "ap-south-1"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.0.1.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}


variable "public-subnet-2-cidr" {
  default       = "10.0.2.0/24"
  description   = "Public Subnet 2 CIDR Block"
  type          = string
}

locals {
  common_prefix = "esdemo"
  elk_domain = "${local.common_prefix}-elk-domain"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}