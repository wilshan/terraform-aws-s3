# Bucket creation to keep source data
resource "aws_s3_bucket" "bucket_source_data" {
  bucket = var.bucketname
  acl    = var.acl
  tags = {
    environment = var.env
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

    prefix = var.prefix

    transition {
      days          = var.STANDARD_IA_days
      storage_class = var.STANDARD_IA
    }

    transition {
      days          = var.GLACIER_days
      storage_class = var.GLACIER
    }

    expiration {
      days = var.expiration_days
    }
  }
  
  replication_configuration {
    role = var.sameaccount_replication_rule

    rules {
      prefix = var.prefix
      status = var.replication_rules_enabled

      destination {
        bucket             = var.destination_bucket
        replica_kms_key_id = var.kms_master_key_id
      }

      source_selection_criteria {
        sse_kms_encrypted_objects {
          enabled = var.replicate_objects_encryption
        }
      }
    }
  }
}
