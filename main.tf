resource "aws_kms_key" "this" {
  count                   = var.use_kms ? 1 : 0
  description             = "KMS key for bucket ${var.bucket}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  policy                  = var.kms_policy

  tags = merge(var.kms_tags, var.tags)
}

resource "aws_kms_alias" "this" {
  count         = var.use_kms ? 1 : 0
  name          = "alias/s3-${var.bucket}"
  target_key_id = aws_kms_key.this[0].id
}

resource "aws_s3_bucket" "this" {
  bucket        = var.bucket
  force_destroy = var.force_destroy

  tags = merge(var.bucket_tags, var.tags)
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.use_kms ? "aws:kms" : "AES256"
      kms_master_key_id = var.use_kms ? aws_kms_key.this[0].id : null
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.policy != null ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = var.policy
}

resource "aws_s3_bucket_website_configuration" "this" {
  count  = var.enable_website ? 1 : 0
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_logging" "this" {
  count         = var.logging_target_bucket != "" && var.logging_target_prefix != "" ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  target_bucket = var.logging_target_bucket
  target_prefix = var.logging_target_prefix
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

