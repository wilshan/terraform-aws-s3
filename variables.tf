#variable "region_name" {
#  type = string
#  default = "us-east-1"
#}

variable "env" {
  type = string
  default = ""
}

variable "bucketname" {
  description = "Name of the bucket"
  type        = string
  default     = ""
}

variable "acl" {
  description = "details of Access control list"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "A state of versioning"
  type        = bool
  default     = true
}

variable "kms_master_key_id" {
    type        = string
    description = "The AWS KMS master key ID used for the SSE-KMS encryption"
    default     = ""
}

variable "sse_algorithm" {
    type        = string
    description = "Required Valid values are AES256 and aws:kms"
    default     = ""
}

variable "lifecycle_rule_id" {
    type        = string
    description = "Apply to all objects in the bucket"
    default     = ""
}

#variable "lifecycle_rule_enabled" {
#    type        = bool
#    description = "Apply to all objects in the bucket"
#}

variable "standard_ia_days" {
    type        = number
    description = "Apply to all objects in the bucket"
    default     = 30
}


variable "expiration_days" {
    type        = number
    description = "Apply to all objects in the bucket"
    default     = 365
}
variable "standard_ia" {
    type        = string
    description = "Apply to all objects in the bucket"
    default     = "standard_ia"
}

variable "glacier_days" {
    type        = number
    description = "Apply to all objects in the bucket"
    default     = 90
}

variable "glacier" {
    type        = string
    description = "Apply to all objects in the bucket"
    default     = "glacier"
}

variable "sameaccount_replication_rule" {
    type        = string
    description = "IAM rule to access s3 objects from same account in different bucket"
    default     = ""
}

variable "destination_bucket" {
    type        = string
    description = "Details of destination bucket"
    default     = ""
}
variable "prefix" {
    type        = string
    description = "This rule applies to all objects in the bucket"
    default     = ""
}

variable "replication_rules_enabled" {
    type        = string
    description = "IAM rule to access s3 objects from same account in different bucket"
    default     = ""
}

#variable "replicate_objects_encryption" {
#    type        = bool
#    description = "Replicate objects encrypted with AWS KMS"
#}

variable "replica_kms_id" {
    type        = string
    description = "Replicate objects encrypted with AWS KMS"
  default     = ""
}

variable "bucket_name" {
    type        = string
    description = "Replicate source bucket objects"
  default     = ""
}
