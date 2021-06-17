variable "region_name" {
  type = string
  default = ""
}

variable "tags" {
  type = map(string)
  default = {
    "name" : "mybucket"
  }
}

variable "bucketname" {
  description = "Name of the bucket"
  type        = string
  default     = "private"
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
    description = "(optional) The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
    default     = ""
}

variable "sse_algorithm" {
    type        = string
    description = "(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
    default     = ""
}
