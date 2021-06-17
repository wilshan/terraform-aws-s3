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

