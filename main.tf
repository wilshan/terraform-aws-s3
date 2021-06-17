# Bucket creation to keep source data

resource "aws_s3_bucket" "bucket_source_data" {
  bucket = var.bucketname
  acl    = var.acl
  tags = {
    environment = "test"
  }
  
 versioning {
    enabled = var.versioning_enabled
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  
  lifecycle_rule {
    id      = var.lifecycle_rule_id
    enabled = var.lifecycle_rule_enabled

    prefix = "*"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}
