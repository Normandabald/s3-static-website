data "aws_acm_certificate" "ssl_cert" {
  provider = aws.us-east-1
  domain   = "*.${local.domain_name}"
  statuses = ["ISSUED"]
}