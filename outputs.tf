output "arn" {
  value = aws_s3_bucket.this.arn
}

output "id" {
  value = aws_s3_bucket.this.id
}

output "bucket" {
  value = aws_s3_bucket.this.bucket
}

output "acl" {
  value = var.object_ownership == "BucketOwnerEnforced" ? "" : aws_s3_bucket_acl.this[0].acl
  
}

output "domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}

output "website_endpoint" {
  value = var.enable_website ? aws_s3_bucket_website_configuration.this[0].website_endpoint : ""
}

output "kms_key_id" {
  value = var.use_kms ? aws_kms_key.this[0].id : ""
}

output "kms_key_arn" {
  value = var.use_kms ? aws_kms_key.this[0].arn : ""
}
