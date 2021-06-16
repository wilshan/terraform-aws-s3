# Bucket creation to keep source data

resource "aws_s3_bucket" "bucket_name" {
  bucket = "var.bucketname"
  acl    = "var.acl"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
   versioning {
    enabled = "var.versioning_enabled"
  }
   dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      enabled                                = lifecycle_rule.value.enabled
      prefix                                 = lifecycle_rule.value.prefix
      tags                                   = lifecycle_rule.value.tags
      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days 
    }
     dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.enable_standard_ia_transition ? [1] : []
        content {
          days          = lifecycle_rule.value.noncurrent_version_standard_ia_transition_days
          storage_class = "STANDARD_IA"
        }
      }
     
     dynamic "transition" {
        for_each = lifecycle_rule.value.enable_standard_ia_transition ? [1] : []

        content {
          days          = lifecycle_rule.value.standard_transition_days
          storage_class = "STANDARD_IA"
        }
      }
     
     dynamic "expiration" {
        for_each = lifecycle_rule.value.enable_current_object_expiration ? [1] : []

        content {
          days = lifecycle_rule.value.expiration_days
        }
      }
