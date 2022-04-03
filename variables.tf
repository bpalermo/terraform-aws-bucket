variable "bucket" {
  description = "The name of the bucket."
  type        = string
}

variable "force_destroy" {
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error (default: false)."
  type        = bool
  default     = false
}

variable "acl" {
  description = "The canned ACL to apply to the bucket (default: private)."
  type        = string
  default     = "private"
}

variable "policy" {
  description = "The name of the bucket to which to apply the policy (default: null)."
  type        = string
  default     = null
}

variable "use_kms" {
  description = "Whether or not to use KMS encryption (default: false)."
  type        = bool
  default     = false
}

variable "kms_deletion_window_in_days" {
  description = "KMS key waiting period, specified in number of days (default: 7)."
  type        = number
  default     = 7
}

variable "kms_policy" {
  description = "A valid policy JSON document (default: null)."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to all objects (default: {})."
  type        = map(string)
  default     = {}
}

variable "bucket_tags" {
  description = "A map of tags to assign to the bucket (default: {})."
  type        = map(string)
  default     = {}
}

variable "kms_tags" {
  description = "A map of tags to assign to the kms key (default: {})."
  type        = map(string)
  default     = {}
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for buckets in this account (default: true)."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for buckets in this account (default: true)."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for buckets in this account (default: true)."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for buckets in this account (default: true)."
  type        = bool
  default     = true
}

variable "enable_website" {
  description = "Enables S3 bucket website configuration (default: false)."
  type        = bool
  default     = false
}

variable "index_document" {
  description = "The name of the error document for the website (default: index.html)."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The object key name to use when a 4XX class error occurs (default: index.html)."
  type        = string
  default     = "index.html"
}

variable "object_ownership" {
  description = "Object ownership (default: BucketOwnerEnforced)."
  type        = string
  default     = "BucketOwnerEnforced"
}
