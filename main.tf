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
      days          = var.standard_ia_days
      storage_class = var.standard_ia
    }

    transition {
      days          = var.glacier_days
      storage_class = var.glacier
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
        replica_kms_key_id = var.replica_kms_id
      }

      source_selection_criteria {
        sse_kms_encrypted_objects {
          enabled = var.replicate_objects_encryption
        }
      }
    }
  }
}
  
  data "aws_s3_bucket" "bucket_source_data" {
  bucket = var.bucket_name
filter   {                                                       
    name = "tag:environment"
   values = ["test"]
  }   
}
 resource "aws_s3_bucket_public_access_block" "bucket_source_data" {
 bucket                  = data.aws_s3_bucket.bucket_source_data.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

