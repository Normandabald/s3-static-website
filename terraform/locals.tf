locals {
    aws_region = "eu-west-2" # London default
    tf_state_bucket_name = "" # Created in step 2 of the Readme
    s3_bucket_name = "" # Name of the S3 bucket to create to hold your website code.
    domain_name = "www.example.co.uk" # Domain name to use for the website. don't include protocols like https:// You should use a fully qualified domain name (FQDN) here.
    root_file = "index.html" # The file to serve as the root of the website
    error_file = "error.html" # The file to serve when an error occurs
}