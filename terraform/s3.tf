resource "aws_s3_bucket" "static_website" {
  bucket = local.s3_bucket_name
  acl    = "private"

  website {
    index_document = local.root_file
    error_document = local.error_file
  }

  tags = local.tags

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}