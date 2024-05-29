resource "aws_acm_certificate" "ssl_cert" {
  provider = "aws.us-east-1"
  domain_name = local.domain_name
  subject_alternative_names = ["*.${local.domain_name}"]
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "ssl_cert" {
  certificate_arn = aws_acm_certificate.ssl_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation: record.fqdn]  
}