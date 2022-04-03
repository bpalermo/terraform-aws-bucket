module "bucket" {
  source = "../.."
  bucket = var.bucket

  acl           = "log-delivery-write"
  force_destroy = var.force_destroy
  policy        = var.policy

  use_kms                     = var.use_kms
  kms_policy                  = var.kms_policy
  kms_deletion_window_in_days = var.kms_deletion_window_in_days

  tags        = var.tags
  kms_tags    = var.kms_tags
  bucket_tags = var.bucket_tags
}
