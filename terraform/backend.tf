# Configures terraform S3 backend
terraform {
  backend "s3" {
    bucket = local.tf_state_bucket_name
    key    = "website/terraform.tfstate"
    region = local.aws_region
  }
}
