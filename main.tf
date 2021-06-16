# Bucket creation to keep source data

resource "aws_s3_bucket" "bucket_name" {
  bucket = "var.bucketname"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
   versioning {
    enabled = "var.versioning_enabled"
  }

}
