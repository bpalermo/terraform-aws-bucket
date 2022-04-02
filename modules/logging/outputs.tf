output "arn" {
  value = module.bucket.arn
}

output "id" {
  value = module.bucket.id
}

output "bucket" {
  value = module.bucket.bucket
}

output "acl" {
  value = module.bucket.acl
}

output "kms_key_id" {
  value = module.bucket.kms_key_id
}

output "kms_key_arn" {
  value = module.bucket.kms_key_arn
}
