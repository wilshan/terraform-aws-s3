
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

variable "lifecycle_rules" {
  description = "A list of lifecycle rules"
  type = list(object({
    prefix  = string
    enabled = bool
    tags    = map(string)

    enable_standard_ia_transition = bool
   

    abort_incomplete_multipart_upload_days = number
    noncurrent_version_expiration_days = number

    standard_transition_days    = number
    expiration_days             = number
  }))
}

