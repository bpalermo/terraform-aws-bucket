variable "bucket" {
  description = "The name of the bucket."
  type        = string
}

variable "force_destroy" {
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error (default: false)."
  type        = bool
  default     = false
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
