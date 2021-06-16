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
   dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      enabled                                = lifecycle_rule.value.enabled
      prefix                                 = lifecycle_rule.value.prefix
      tags                                   = lifecycle_rule.value.tags
      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days
      
noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
      
      
      
      #dynamic "transition" {
     #   for_each = lifecycle_rule.value.enable_standard_ia_transition ? [1] : []

      #  content {
       #   days          = lifecycle_rule.value.standard_transition_days
          #storage_class = "STANDARD_IA"
        #}
    # noncurrent_version_expiration {
   #     days = lifecycle_rule.value.noncurrent_version_expiration_days
   #}
}
