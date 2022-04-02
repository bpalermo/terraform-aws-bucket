terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "random_uuid" "bucket" {
}

module "bucket" {
  source = "../.."
  bucket = random_uuid.bucket.id
}

resource "test_assertions" "bucket" {

  component = "name"

  equal "bucket_name" {
    description = "bucket name"
    got         = module.bucket.bucket
    want        = random_uuid.bucket.id
  }
}

module "bucket_logging" {
  source = "../../modules/logging"
  bucket = random_uuid.bucket.id
}

resource "test_assertions" "bucket_logging" {

  component = "acl"

  equal "bucket_acl" {
    description = "bucket acl"
    got         = module.bucket.acl
    want        = "log-delivery-write"
  }
}
