# Bucket creation to keep source data

resource "aws_s3_bucket" "bucket_source_data" {
  bucket = var.bucketname
  acl    = var.acl
  tags = {
    environment = "test"
  }
}
  {
  versioning = var.versioning_enabled
  }
