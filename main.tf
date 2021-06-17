# Bucket creation to keep source data

resource "aws_s3_bucket" "bucket_source_data" {
  bucket = "var.bucketname"
  acl    = "var.acl"
  tags   = "var.tags"
  versioning = "var.versioning_enabled"
  }
