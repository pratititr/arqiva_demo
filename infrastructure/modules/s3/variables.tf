variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "bucket_acl" {
  description = "The access control for the S3 bucket."
  type        = string
  default     = "public"
}

variable "bucket_ownership_controls" {
  description = "Bucket-level setting that you can use to control ownership of objects"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket."
  type        = string
  default     = "Enabled"
}

variable "encryption_type" {
  description = "The type of server-side encryption to apply to the S3 bucket."
  type        = string
  default     = "AES256"
}
