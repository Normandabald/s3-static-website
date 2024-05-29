terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }
  required_version = "1.6.2"
}

provider "aws" {
  region = "eu-west-2"
} 

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
} 