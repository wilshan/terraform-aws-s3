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
}
